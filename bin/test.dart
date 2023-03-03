// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:application/l10n/Dictionaries.dart';
import 'package:application/l10n/language/en_US.dart';
import 'package:application/l10n/language/zh_CN.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  DictionariesBuild().build({
    zh_CN().toString(): zh_CN(),
    en_US().toString(): en_US(),
  });
}
