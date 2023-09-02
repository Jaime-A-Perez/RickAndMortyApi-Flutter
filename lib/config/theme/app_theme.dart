import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.green[400],
    brightness: Brightness.dark,
    shadowColor:  const Color.fromARGB(191, 12, 255, 49),
    disabledColor:  const Color.fromRGBO(254, 39, 204, 1)

  );
}