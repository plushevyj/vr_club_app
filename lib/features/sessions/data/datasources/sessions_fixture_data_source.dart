import '../models/session_dto.dart';

class SessionsFixtureDataSource {
  Future<List<SessionDTO>> getSessions() async {
    return [
      SessionDTO(
        id: '1024',
        client: 'Иванов И.И.',
        room: '11x7 (1)',
        equipment: 'Очки 1,2 / Л,П',
        startTime: DateTime(2025, 5, 24, 14, 30),
        endTime: DateTime(2025, 5, 24, 18, 30),
        status: 'Завершен',
      ),
      SessionDTO(
        id: '1023',
        client: 'Петров П.П.',
        room: '6x4 (2)',
        equipment: 'Очки 1,2 / Л,П',
        startTime: DateTime(2025, 5, 24, 15, 00),
        endTime: DateTime(2025, 5, 24, 17, 00),
        status: 'Завершен',
      ),
      SessionDTO(
        id: '1022',
        client: 'Сидоров С.С.',
        room: '8x6 (2)',
        equipment: 'Очки 1,2 / Л,П',
        startTime: DateTime(2025, 5, 24, 8, 00),
        endTime: DateTime(2025, 5, 24, 11, 00),
        status: 'Завершен',
      ),
      SessionDTO(
        id: '1021',
        client: 'Александрова А.А.',
        room: '11x7 (2)',
        equipment: 'Очки 1,2 / Л,П',
        startTime: DateTime(2025, 5, 23, 20, 00),
        endTime: DateTime(2025, 5, 24, 00, 00),
        status: 'Завершен',
      ),
    ];
  }
}
