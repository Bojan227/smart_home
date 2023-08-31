import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/enums.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';
import 'package:smart_home/presentation/ui/home/widgets/room_item.dart';

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
            child: GridView.builder(
              itemCount: state.rooms.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) =>
                  RoomItem(roomEntity: state.rooms[index], index: index),
            ),
          );
        }

        return Container();
      },
    );
  }
}
