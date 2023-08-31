import 'package:get_it/get_it.dart';
import 'package:smart_home/data/repositories/smart_home_repo_impl.dart';
import 'package:smart_home/domain/repositories/smart_home_repository.dart';
import 'package:smart_home/domain/usecases/get_rooms_usecase.dart';
import 'package:smart_home/domain/usecases/update_room_status_usecase.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';

GetIt getIt = GetIt.instance;

Future setupInjector() async {
  final SmartHomeRepository smartHomeRepository = SmartHomeRepositoryImpl();

  final GetRoomsUseCase getRoomsUseCase =
      GetRoomsUseCase(smartHomeRepository: smartHomeRepository);

  final UpdateRoomStatusUseCase updateRoomStatusUseCase =
      UpdateRoomStatusUseCase(smartHomeRepository: smartHomeRepository);

  final RoomsBloc roomsBloc = RoomsBloc(
      getRoomsUseCase: getRoomsUseCase,
      updateRoomStatusUseCase: updateRoomStatusUseCase);
  getIt.registerSingleton<RoomsBloc>(roomsBloc);
}
