import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/ui/home/widgets/bottom_tab_item.dart';
import 'package:smart_home/theme/colour_palette.dart';

List<IconData> tabItems = [
  Icons.home,
  Icons.mic,
  Icons.analytics,
  Icons.settings
];

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final int selectedIndex = context.watch<TabCubit>().state;

    return BottomAppBar(
      height: 80,
      elevation: 0,
      color: colourPalette.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < tabItems.length; i++)
            BottomTabItem(
                index: i, iconData: tabItems[i], selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
