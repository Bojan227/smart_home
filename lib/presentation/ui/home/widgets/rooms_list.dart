import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/animations/custom_page_route.dart';
import 'package:smart_home/core/enums.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/blocs/room/cubit/scroll_cubit.dart';
import 'package:smart_home/presentation/blocs/room/cubit/temperature_cubit.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';
import 'package:smart_home/presentation/ui/home/widgets/room_item.dart';
import 'package:smart_home/presentation/ui/room/room_screen.dart';

import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsBloc, RoomsState>(
      builder: (context, state) {
        if (state.roomsStatus == Status.loading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.roomsStatus == Status.success) {
          return Expanded(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: ReorderableGridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => GestureDetector(
                    key: ValueKey(state.rooms[index]),
                    onTap: () {
                      Navigator.of(context).push(CustomPageRoute(
                          direction: AxisDirection.up,
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => TabCubit(),
                              ),
                              BlocProvider(
                                create: (context) => TemperatureCubit(),
                              ),
                              BlocProvider(
                                create: (context) => ScrollCubit(),
                              ),
                            ],
                            child: RoomScreen(room: state.rooms[index]),
                          )));
                    },
                    child:
                        RoomItem(roomEntity: state.rooms[index], index: index),
                  ),
                  itemCount: state.rooms.length,
                  onReorder: (oldIndex, newIndex) {
                    context.read<RoomsBloc>().add(
                        ReorderRooms(oldIndex: oldIndex, newIndex: newIndex));
                  },
                )

                //  GridView.builder(
                //   itemCount: state.rooms.length,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                //   itemBuilder: (context, index) => GestureDetector(
                //     onTap: () {
                //       Navigator.of(context).push(CustomPageRoute(
                //           direction: AxisDirection.up,
                //           child: MultiBlocProvider(
                //             providers: [
                //               BlocProvider(
                //                 create: (context) => TabCubit(),
                //               ),
                //               BlocProvider(
                //                 create: (context) => TemperatureCubit(),
                //               ),
                //               BlocProvider(
                //                 create: (context) => ScrollCubit(),
                //               ),
                //             ],
                //             child: RoomScreen(room: state.rooms[index]),
                //           )));
                //     },
                //     child: RoomItem(roomEntity: state.rooms[index], index: index),
                //   ),
                // ),
                ),
          );
        }

        return Container();
      },
    );
  }
}
