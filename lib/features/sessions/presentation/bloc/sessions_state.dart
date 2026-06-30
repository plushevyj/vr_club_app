part of 'sessions_bloc.dart';

@immutable
sealed class SessionsState {
  const SessionsState();
}

final class SessionsInitialState extends SessionsState {
  const SessionsInitialState();
}

final class SessionsLoadingState extends SessionsState {
  const SessionsLoadingState();
}

final class GotSessionsState extends SessionsState {
  final List<Session> sessions;

  const GotSessionsState({required this.sessions});
}

final class ErrorSessionsState extends SessionsState {
  final String error;

  const ErrorSessionsState({required this.error});
}
