import 'package:flutter/material.dart';

class AppTheme {

  AppTheme();

  ColorScheme _getColorScheme() {
    final colors = ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFFD7F3FF),
      secondary: const Color(0xFFe29e21), 
      surface: const Color(0xFF17202a),
      error: Colors.red[400]!,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: const Color(0xFF434c57),
      onError: Colors.white,
    );

    return colors;
  }

  ThemeData getTheme() {
    final colorScheme = _getColorScheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'Onest',
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
    );
  }
  
}