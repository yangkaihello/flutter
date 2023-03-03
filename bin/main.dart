// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) async {
  // 创建ArgParser的实例，同时指定需要输入的参数
  final ArgParser argParser = ArgParser()
    ..addOption('json', abbr: 'j', help: "来源的json数据文件(起始目录项目根目录)")
    ..addOption('dart', abbr: 'd', help: "目标的dart数据文件(起始目录项目根目录)")
    ..addFlag('help',
        abbr: 'h', negatable: false, help: "Displays this help information.");
  ArgResults argResults = argParser.parse(arguments);

  if (argResults['json'] == null) {
    print('not --json need dart path');
    exit(0);
  }

  if (argResults['dart'] == null) {
    print('not --dart need dart path');
    exit(0);
  }

  String jsonFile = argResults['json'];
  String dartFile = argResults['dart'];
  String path = Directory.current.path;

  jsonFile =
      "$path/${jsonFile.replaceAll("/", "\t").trim().replaceAll("\t", "/")}";
  dartFile =
      "$path/${dartFile.replaceAll("/", "\t").trim().replaceAll("\t", "/")}";

  File json = File(jsonFile);
  File dart = File(dartFile);
  String jsonString = await json.readAsString();
  String buildClass = LanguageObject(json: jsonString)
      .build(json.uri.pathSegments.last.split('.').first);

  dart.writeAsStringSync(buildClass);
}

class LanguageObject {
  late String json;
  bool? is_map = true;

  LanguageObject({required this.json, this.is_map});

  String buildParams(Map<String, String> data) {
    Map<String, String> params = {};
    data.forEach((key, value) {
      params[key] = "  static const $key = '$value';";
    });
    return params.values.join("\n");
  }

  List<String> buildMap(Map<String, String> data) {
    List<String> params = [];
    params.add("Map<String, String> toMap() => {");
    data.forEach((key, value) {
      params.add('  "$key": $key,');
    });
    params.add("};");
    return params;
  }

  List<String> retract(List<String> data) {
    for (var i = 0; i < data.length; i++) {
      data[i] = "  ${data[i]}";
    }
    return data;
  }

  String build(String fileName) {
    var data = jsonDecode(json);

    if (data is! Map) {
      return "not map";
    }
    Map<String, String> dataNew = Map<String, String>.from(data);

    String params = buildParams(dataNew);
    List<String> toMap = buildMap(dataNew);
    toMap = retract(toMap);

    List<String> template = [];
    template.add("// ignore_for_file: constant_identifier_names, file_names");
    template.add("class $fileName {");
    template.add(params);
    template.add("");
    template.add(toMap.join("\n"));
    template.add("}");

    return template.join("\n");
  }
}
