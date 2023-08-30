import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/ui/home/widgets/tab_item.dart';

List<Map<String, dynamic>> tabs = [
  {'label': 'Rooms', 'index': 0},
  {'label': 'Devices', 'index': 1}
];

class TabRow extends StatelessWidget {
  const TabRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabs
              .map(
                (tab) => TabItem(
                    label: tab['label'],
                    index: tab['index'],
                    isActive: tab['index'] == state ? true : false),
              )
              .toList(),
        );
      },
    );
  }
}
