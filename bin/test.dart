// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:application/l10n/Dictionaries.dart';
import 'package:application/l10n/language/en_US.dart';
import 'package:application/l10n/language/zh_CN.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();

  print(extenderFoo.toString());
  print(someBaseClassFoo.toString());
}

class SomeBaseClass {
  // Any type provided to Foo for T must be non-nullable.
  test() {
    print("test");
  }
}

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {
  test1() {
    print("test1");
  }
}
