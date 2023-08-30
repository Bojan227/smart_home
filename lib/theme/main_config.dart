import 'package:flutter/material.dart';

class MainConfig extends ThemeExtension<MainConfig> {
  final double? homeScreenPadding;
  final double? cardPadding;
  final double? roomCardPadding;

  const MainConfig({
    required this.homeScreenPadding,
    required this.cardPadding,
    required this.roomCardPadding,
  });

  @override
  ThemeExtension<MainConfig> copyWith({
    double? homeScreenPadding,
    double? cardPadding,
    double? roomCardPadding,
  }) {
    return MainConfig(
      homeScreenPadding: homeScreenPadding ?? this.homeScreenPadding,
      cardPadding: cardPadding ?? this.cardPadding,
      roomCardPadding: roomCardPadding ?? this.roomCardPadding,
    );
  }

  @override
  ThemeExtension<MainConfig> lerp(
      covariant ThemeExtension<MainConfig>? other, double t) {
    if (other is! MainConfig) {
      return this;
    }
    return MainConfig(
      homeScreenPadding: homeScreenPadding,
      cardPadding: cardPadding,
      roomCardPadding: roomCardPadding,
    );
  }

  static const mainConfig = MainConfig(
    homeScreenPadding: 12.0,
    cardPadding: 10.0,
    roomCardPadding: 12.0,
  );
}
