import '../models/vr_room_dto.dart';

class DashboardFixtureDataSource {
  Future<List<VRRoomDTO>> getDashboard() async {
    return [
      const VRRoomDTO(
        id: '0',
        name: 'Площадка 11x7 (1)',
        helmetCharge: 87,
        leftControllerCharge: 92,
        rightControllerCharge: 89,
        status: 'Свободно',
      ),
      const VRRoomDTO(
        id: '1',
        name: 'Площадка 11x7 (2)',
        helmetCharge: 74,
        leftControllerCharge: 68,
        rightControllerCharge: 71,
        status: 'Занято',
      ),
      const VRRoomDTO(
        id: '2',
        name: 'Площадка 11x7 (2)',
        helmetCharge: 31,
        leftControllerCharge: 28,
        rightControllerCharge: 35,
        status: 'Низкий заряд',
      ),
      const VRRoomDTO(
        id: '3',
        name: 'Площадка 8x6 (2)',
        helmetCharge: 95,
        leftControllerCharge: 98,
        rightControllerCharge: 96,
        status: 'Свободно',
      ),
      const VRRoomDTO(
        id: '4',
        name: 'Площадка 6x4 (1)',
        helmetCharge: 12,
        leftControllerCharge: 8,
        rightControllerCharge: 15,
        status: 'Критически низкий заряд',
      ),
      const VRRoomDTO(
        id: '5',
        name: 'Площадка 6x4 (2)',
        helmetCharge: 63,
        leftControllerCharge: 57,
        rightControllerCharge: 61,
        status: 'Занято',
      ),
    ];
  }
}
