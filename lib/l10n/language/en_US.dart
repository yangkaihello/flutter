// ignore_for_file: camel_case_types, file_names

import 'package:application/l10n/Dictionaries.dart';
import 'package:application/l10n/Translation.dart';

class en_US implements Dictionaries {
  @override
  Map<String, String> dictionaries = {
    Translation.HOME_TITLE: 'home title',
    Translation.HELLO_WORLD: 'hello world',
  };
}
