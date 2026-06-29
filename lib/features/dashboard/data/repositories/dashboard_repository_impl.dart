import '../../domain/domain.dart';
import '../datasources/dashboard_fixture_data_source.dart';
import '../models/vr_room_dto.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardFixtureDataSource dataSource;

  DashboardRepositoryImpl(this.dataSource);

  @override
  Future<List<VRRoom>> getVRRooms() async {
    final vrRoomsDTO = await dataSource.getDashboard();

    return vrRoomsDTO.map((vrRoomDTO) {
      return VRRoom(
        id: vrRoomDTO.id,
        name: vrRoomDTO.name,
        helmetCharge: vrRoomDTO.helmetCharge,
        leftControllerCharge: vrRoomDTO.leftControllerCharge,
        rightControllerCharge: vrRoomDTO.rightControllerCharge,
        status: switch (vrRoomDTO.status) {
          'Свободно' => DisplayRoomStatus.vacant,
          'Занято' => DisplayRoomStatus.occupied,
          'Низкий заряд' => DisplayRoomStatus.lowCharge,
          'Критически низкий заряд' => DisplayRoomStatus.criticallyLowCharge,
          _ => DisplayRoomStatus.vacant,
        },
      );
    }).toList();
  }
}
