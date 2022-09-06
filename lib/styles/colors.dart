import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  final Color accent1 = const Color(0xFF4962B0);
  final Color accent2 = const Color(0xFF8194E8);
  final Color accent3 = const Color(0xFFEBEEFF);
  final Color offWhite = const Color(0xFFF5F5F5);
  final Color caption = const Color(0xFF444655);
  final Color body = const Color(0xFF514F4D);
  final Color greyStrong = const Color.fromARGB(243, 37, 37, 39);
  final Color greyMedium = const Color(0xFFA9AABC);
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);

  final bool isDark = false;

  ThemeData toThemeData() {
    TextTheme txtTheme = GoogleFonts.senTextTheme();
    Color txtColor = white;
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryContainer: accent1,
        secondary: accent1,
        secondaryContainer: accent1,
        background: offWhite,
        surface: offWhite,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    var t =
        ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: accent1),
      highlightColor: accent1,
    );

    return t;
  }
}
