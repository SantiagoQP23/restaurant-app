import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blue, surface: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          // elevation:
          //     WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          //   if (states.contains(WidgetState.hovered)) {
          //     return 5.0;
          //   } else {
          //     return 3.0;
          //   }
          // }),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          //   if (states.contains(WidgetState.hovered)) {
          //     return Colors.white;
          //   } else {
          //     return Colors.blue;
          //   }
          // }),
          shadowColor: WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
          // textStyle: WidgetStateProperty.all(
          //     GoogleFonts.prompt(fontWeight: FontWeight.w600)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          // foregroundColor:
          //     WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          //   if (states.contains(WidgetState.hovered)) {
          //     return Colors.blue;
          //   } else {
          //     return Colors.white;
          //   }
          // })
        )));
  }
}
