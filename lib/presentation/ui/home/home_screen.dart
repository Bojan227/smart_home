import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/ui/home/widgets/bottom_nav_bar.dart';
import 'package:smart_home/presentation/ui/home/widgets/consumption_card.dart';
import 'package:smart_home/presentation/ui/home/widgets/rooms_list.dart';
import 'package:smart_home/presentation/ui/home/widgets/tab_row.dart';
import 'package:smart_home/presentation/ui/room/widgets/slider.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final mainConfig = Theme.of(context).extension<MainConfig>()!;

    return Scaffold(
      bottomNavigationBar: BlocProvider(
        create: (context) => TabCubit(),
        child: const BottomNavBar(),
      ),
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: mainConfig.homeScreenPadding!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(),
                  Icon(
                    Icons.notifications_outlined,
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Hello, Emmanuel',
                style: textTheme.title,
              ),
              const SizedBox(
                height: 16,
              ),
              const ConsumptionCard(),
              const SizedBox(
                height: 22,
              ),
              BlocProvider(
                create: (context) => TabCubit(),
                child: const TabRow(),
              ),
              const SizedBox(
                height: 8,
              ),
              const RoomsList()
            ],
          ),
        ),
      ),
    );
  }
}
