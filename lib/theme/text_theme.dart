import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyle? title;
  final TextStyle? bodyLarge;
  final TextStyle? bodyMedium;
  final TextStyle? labelMedium;

  const CustomTextTheme({
    required this.title,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.labelMedium,
  });

  @override
  ThemeExtension<CustomTextTheme> copyWith({
    TextStyle? title,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? labelMedium,
  }) {
    return CustomTextTheme(
      title: title ?? this.title,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      labelMedium: labelMedium ?? this.labelMedium,
    );
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(
      covariant ThemeExtension<CustomTextTheme>? other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
        title: title,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        labelMedium: labelMedium);
  }

  static final textTheme = CustomTextTheme(
    title: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal),
    labelMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
  );
}
