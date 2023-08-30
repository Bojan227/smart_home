import 'package:flutter/material.dart';
import 'package:smart_home/presentation/ui/home/widgets/consumption_card.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final mainConfig = Theme.of(context).extension<MainConfig>()!;

    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.all(mainConfig.homeScreenPadding!),
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
              const ConsumptionCard()
            ],
          ),
        ),
      ),
    );
  }
}
