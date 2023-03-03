// ignore_for_file: camel_case_types, file_names

import 'package:application/l10n/Dictionaries.dart';
import 'package:application/l10n/Translation.dart';

class zh_CN implements Dictionaries {
  @override
  Map<String, String> dictionaries = {
    Translation.HOME_TITLE: '首页标题',
    Translation.HELLO_WORLD: '你好世界',
  };
}
