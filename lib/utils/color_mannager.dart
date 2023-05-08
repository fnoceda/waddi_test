import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.from('#361574');
  static Color secondaryColor = HexColor.from('#998AED');
  static Color treeColor = HexColor.from('#D4CCF8');

  static Color backgroundColor = HexColor.from('#F7F7F7');
  static Color error = HexColor.from('#D51438');
  static Color white = HexColor.from('#FFFFFF');
}

extension HexColor on Color {
  static Color from(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

MaterialColor kPrimaryColor = const MaterialColor(
  0xFF361574,
  <int, Color>{
    50: Color(0xFF361574),
    100: Color(0xFF361574),
    200: Color(0xFF361574),
    300: Color(0xFF361574),
    400: Color(0xFF361574),
    500: Color(0xFF361574),
    600: Color(0xFF361574),
    700: Color(0xFF361574),
    800: Color(0xFF361574),
    900: Color(0xFF361574),
  },
);

MaterialColor kSecondaryColor = const MaterialColor(
  0xFF998AED,
  <int, Color>{
    50: Color(0xFF998AED),
    100: Color(0xFF998AED),
    200: Color(0xFF998AED),
    300: Color(0xFF998AED),
    400: Color(0xFF998AED),
    500: Color(0xFF998AED),
    600: Color(0xFF998AED),
    700: Color(0xFF998AED),
    800: Color(0xFF998AED),
    900: Color(0xFF998AED),
  },
);
