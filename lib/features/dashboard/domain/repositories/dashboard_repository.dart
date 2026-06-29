
import '../entities/vr_room.dart';

abstract class DashboardRepository {
  Future<List<VRRoom>> getVRRooms();
}
