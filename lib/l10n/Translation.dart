// ignore_for_file: constant_identifier_names, file_names
class Translation {
  static const HELLO_WORLD = 'hello-world';
  static const HOME_TITLE = 'home-title';

  Map<String, String> toMap() => {
        "HELLO_WORLD": HELLO_WORLD,
        "HOME_TITLE": HOME_TITLE,
      };
}
