import 'package:flutter/material.dart';

const int _customBluePrimaryValue = 0xFF1DA1F2;
const MaterialColor customBlue = MaterialColor(_customBluePrimaryValue, <int, Color>{
  50: Color(0x1A1DA1F2),
  100: Color(0x331DA1F2),
  200: Color(0x4D1DA1F2),
  300: Color(0x661DA1F2),
  400: Color(0x801DA1F2),
  500: Color(0x991DA1F2),
  600: Color(0xB31DA1F2),
  700: Color(0xCC1DA1F2),
  800: Color(0xE61DA1F2),
  900: Color(0xFF1DA1F2),
});

ThemeData theme() {
  return ThemeData(primarySwatch: customBlue, fontFamily: 'Roboto', useMaterial3: false);
}
