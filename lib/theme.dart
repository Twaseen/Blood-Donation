import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white, // Set your desired light theme background color
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ),
    ),
  );

  static ThemeData darktheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black, // Set your desired dark theme background color
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white70,
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24,
      ),
    ),
  );
}