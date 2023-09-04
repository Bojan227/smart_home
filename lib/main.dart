import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/injector.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';
import 'package:smart_home/presentation/ui/home/home_screen.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomsBloc roomsBloc = getIt<RoomsBloc>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData.light().copyWith(
          useMaterial3: true,
          extensions: <ThemeExtension<dynamic>>[
            ColourPalette.mainPalette,
            CustomTextTheme.textTheme,
            MainConfig.mainConfig
          ]),
      home: BlocProvider(
        create: (context) => roomsBloc..add(GetRooms()),
        child: const HomeScreen(),
      ),
    );
  }
}
