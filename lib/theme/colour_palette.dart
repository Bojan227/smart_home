import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/colour_from_hex.dart';

class ColourPalette extends ThemeExtension<ColourPalette> {
  final Color? blue;
  final Color? orange;
  final Color? darkBlue;
  final Color? spunPearl;
  final Color? lightGrayishBlue;
  final Color? white;
  final Color? whiteWithOpacity;
  final Color? darkBlueWithOpacity;
  final Color? lightGrayishOrange;

  const ColourPalette(
      {required this.blue,
      required this.orange,
      required this.darkBlue,
      required this.spunPearl,
      required this.lightGrayishBlue,
      required this.white,
      required this.whiteWithOpacity,
      required this.darkBlueWithOpacity,
      required this.lightGrayishOrange});

  @override
  ThemeExtension<ColourPalette> copyWith(
      {Color? blue,
      Color? orange,
      Color? darkBlue,
      Color? spunPearl,
      Color? lightGrayishBlue,
      Color? white,
      Color? whiteWithOpacity,
      Color? darkBlueWithOpacity,
      Color? lightGrayishOrange}) {
    return ColourPalette(
      blue: blue ?? this.blue,
      orange: orange ?? this.orange,
      darkBlue: darkBlue ?? this.darkBlue,
      spunPearl: spunPearl ?? this.spunPearl,
      lightGrayishBlue: lightGrayishBlue ?? this.lightGrayishBlue,
      lightGrayishOrange: lightGrayishOrange ?? this.lightGrayishOrange,
      white: white ?? this.white,
      whiteWithOpacity: whiteWithOpacity ?? this.whiteWithOpacity,
      darkBlueWithOpacity: darkBlueWithOpacity ?? this.darkBlueWithOpacity,
    );
  }

  @override
  ThemeExtension<ColourPalette> lerp(
      covariant ThemeExtension<ColourPalette>? other, double t) {
    if (other is! ColourPalette) {
      return this;
    }
    return ColourPalette(
      blue: Color.lerp(blue, other.blue, t),
      orange: Color.lerp(orange, other.orange, t),
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t),
      spunPearl: Color.lerp(spunPearl, other.spunPearl, t),
      lightGrayishBlue: Color.lerp(lightGrayishBlue, other.lightGrayishBlue, t),
      white: Color.lerp(white, other.white, t),
      lightGrayishOrange:
          Color.lerp(lightGrayishOrange, other.lightGrayishOrange, t),
      whiteWithOpacity: Color.lerp(whiteWithOpacity, other.whiteWithOpacity, t),
      darkBlueWithOpacity:
          Color.lerp(darkBlueWithOpacity, other.darkBlueWithOpacity, t),
    );
  }

  static final mainPalette = ColourPalette(
    blue: colorFromHex('#7F85F9'),
    orange: colorFromHex('#F9B23D'),
    darkBlue: colorFromHex('#171935'),
    spunPearl: colorFromHex('#A2A9B8'),
    lightGrayishBlue: colorFromHex('#EAEDF2'),
    white: colorFromHex('#FFFFFF'),
    whiteWithOpacity: colorFromHex('#FFFFFF').withOpacity(0.1),
    darkBlueWithOpacity: colorFromHex('#171935').withOpacity(0.6),
    lightGrayishOrange: colorFromHex('#fcdfaf'),
  );
}
