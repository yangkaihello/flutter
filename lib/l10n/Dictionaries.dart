// ignore_for_file: file_names

import 'package:application/l10n/Translation.dart';

abstract class Dictionaries {
  late Map<String, String> dictionaries;
}

class DictionariesBuild {
  Map<String, Map<String, String>> build(
      Map<String, Dictionaries> dictionaries) {
    Map<String, Map<String, String>> map;
    map = dictionaries.map((language, dictionarie) {
      Translation().toMap().forEach((key, value) {
        if (dictionarie.dictionaries[value] == null) {
          print('[$language][$key] is not definition');
        }
      });
      return MapEntry(language, dictionarie.dictionaries.map((key, value) {
        return MapEntry(key, value);
      }));
    });
    return map;
  }
}
