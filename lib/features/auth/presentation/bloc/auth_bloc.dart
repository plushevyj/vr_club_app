import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> login(String login, String password) async {
    add(AuthLoginRequested(login, password));
  }

  void logout() => add(AuthLogoutRequested());

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    final user = await loginUseCase(event.login, event.password);
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthFailure('Неверный логин или пароль'));
    }
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
