// ignore_for_file: file_names, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:application/l10n/Dictionaries.dart';
import 'package:application/l10n/language/en_US.dart';
import 'package:application/l10n/language/zh_CN.dart';
import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    if (dictionaries == null) {
      return {};
    }

    return DictionariesBuild().build(dictionaries);
  }

  Map<String, Dictionaries> dictionaries = {
    en_US().runtimeType.toString(): en_US(),
    zh_CN().runtimeType.toString(): zh_CN(),
  };

  void reload(Map<String, Dictionaries> d) {
    dictionaries = d;
  }
}
