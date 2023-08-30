import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyle? title;
  final TextStyle? bodyLarge;
  final TextStyle? bodyMedium;

  const CustomTextTheme(
      {required this.title, required this.bodyLarge, required this.bodyMedium});

  @override
  ThemeExtension<CustomTextTheme> copyWith({
    TextStyle? title,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
  }) {
    return CustomTextTheme(
      title: title ?? this.title,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
    );
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(
      covariant ThemeExtension<CustomTextTheme>? other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
        title: title, bodyLarge: bodyLarge, bodyMedium: bodyMedium);
  }

  static final textTheme = CustomTextTheme(
    title: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal),
  );
}
