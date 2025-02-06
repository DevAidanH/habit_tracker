import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.robotoTextTheme(),
  colorScheme: ColorScheme.light(
    surface: Color(0xFFe0e0e0),
    primary: Color(0xFF2e2d40),
    secondary: Color(0xFFebebeb),
    tertiary: Color(0xFF41a345),
    surfaceDim: Color(0xFFff6685)
  ),
);