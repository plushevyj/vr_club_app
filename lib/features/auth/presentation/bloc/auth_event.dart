abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String login;
  final String password;

  AuthLoginRequested(this.login, this.password);
}

class AuthLogoutRequested extends AuthEvent {}
