import 'package:flutter/material.dart';

final digioBankTheme = ThemeData(
  primaryColor: Colors.blueAccent[700],
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent[700],
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
);
