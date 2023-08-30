import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';
import 'package:smart_home/presentation/ui/home/widgets/room_item.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsBloc, RoomsState>(
      builder: (context, state) {
        if (state is RoomsLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RoomsLoaded) {
          return Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: state.rooms
                  .map((room) => RoomItem(roomEntity: room))
                  .toList(),
            ),
          );
        }

        return Container();
      },
    );
  }
}
