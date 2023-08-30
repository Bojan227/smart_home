import 'package:flutter/material.dart';
import 'package:smart_home/presentation/ui/home/widgets/consumption_header.dart';
import 'package:smart_home/presentation/ui/home/widgets/consumption_info.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';

class ConsumptionCard extends StatelessWidget {
  const ConsumptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final mainConfig = Theme.of(context).extension<MainConfig>()!;

    return Container(
      padding: EdgeInsets.all(mainConfig.cardPadding!),
      decoration: BoxDecoration(
          color: colourPalette.blue,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: colourPalette.whiteWithOpacity,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const ConsumptionHeader(),
          ),
          const SizedBox(
            height: 18,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConsumptionInfo(
                title: '31.7kWh',
                subtitle: 'Today',
                icon: Icons.bolt,
              ),
              ConsumptionInfo(
                title: '491.6kWh',
                subtitle: 'This Month',
                icon: Icons.power,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
