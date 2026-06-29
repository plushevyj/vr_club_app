import '../models/user_dto.dart';

class AuthFixtureDataSource {
  Future<List<UserDto>> getUsers() async {
    return [
      const UserDto(
        id: '1',
        firstName: 'Илья',
        lastName: 'Смирнов',
        patronymic: 'Алексеевич',
        role: 'operator',
        login: 'operator',
        password: '123456',
      ),
      const UserDto(
        id: '2',
        firstName: 'Марина',
        lastName: 'Петрова',
        patronymic: 'Ивановна',
        role: 'admin',
        login: 'admin',
        password: '123456',
      ),
    ];
  }
}
