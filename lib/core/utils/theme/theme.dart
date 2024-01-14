import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[100],
      toolbarHeight: 60,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.purple[100],
      height: 60,
    ),
  );
}
