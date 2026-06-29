import '../../domain/domain.dart';
import '../datasources/auth_fixture_data_source.dart';
import '../models/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFixtureDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity?> login(String login, String password) async {
    final users = await dataSource.getUsers();
    final user = users.firstWhere(
      (value) => value.login == login && value.password == password,
      orElse: () => const UserDto(
        id: '',
        firstName: '',
        lastName: '',
        patronymic: '',
        role: '',
        login: '',
        password: '',
      ),
    );

    if (user.id.isEmpty) {
      return null;
    }

    return UserEntity(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      patronymic: user.patronymic,
      role: user.role,
      login: user.login,
    );
  }
}
