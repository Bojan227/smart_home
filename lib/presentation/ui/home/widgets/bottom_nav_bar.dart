import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/theme/colour_palette.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    return BottomNavigationBar(
      currentIndex: context.watch<TabCubit>().state,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: colourPalette.blue,
      unselectedItemColor: colourPalette.spunPearl,
      onTap: (value) => context.read<TabCubit>().setCurrentIndex(value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.mic_none), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Home')
      ],
    );
  }
}
