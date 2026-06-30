import '../../domain/domain.dart';
import '../datasources/sessions_fixture_data_source.dart';

class SessionsRepositoryImpl implements SessionsRepository {
  final SessionsFixtureDataSource dataSource;

  SessionsRepositoryImpl(this.dataSource);

  @override
  Future<List<Session>> getSessions() async {
    final sessionsDTO = await dataSource.getSessions();

    return sessionsDTO.map((sessionDTO) {
      return Session(
        id: sessionDTO.id,
        client: sessionDTO.client,
        room: sessionDTO.room,
        equipment: sessionDTO.equipment,
        startTime: sessionDTO.startTime,
        endTime: sessionDTO.endTime,
        status: sessionDTO.status,
      );
    }).toList();
  }
}
