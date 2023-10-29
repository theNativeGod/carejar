import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade300,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0065c0)),
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
