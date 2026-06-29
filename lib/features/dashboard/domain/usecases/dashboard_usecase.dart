import '../entities/vr_room.dart';
import '../repositories/dashboard_repository.dart';

class DashboardUseCase {
  final DashboardRepository repository;

  DashboardUseCase(this.repository);

  Future<List<VRRoom>> call() async {
    return repository.getVRRooms();
  }
}
