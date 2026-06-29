class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String patronymic;
  final String role;
  final String login;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.role,
    required this.login,
  });

  String get roleTranslatedRU {
    switch (role) {
      case 'admin':
        return 'Администратор';
      case 'operator':
        return 'Оператор';
      default:
        return '';
    }
  }
}
