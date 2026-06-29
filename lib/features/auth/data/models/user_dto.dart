class UserDto {
  final String id;
  final String firstName;
  final String lastName;
  final String patronymic;
  final String role;
  final String login;
  final String password;

  const UserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.role,
    required this.login,
    required this.password,
  });
}
