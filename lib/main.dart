import 'package:flutter/material.dart';
import 'package:smart_home/presentation/ui/home/home_screen.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData.light().copyWith(
          useMaterial3: true,
          extensions: <ThemeExtension<dynamic>>[
            ColourPalette.mainPalette,
            CustomTextTheme.textTheme,
            MainConfig.mainConfig
          ]),
      home: const HomeScreen(),
    );
  }
}
