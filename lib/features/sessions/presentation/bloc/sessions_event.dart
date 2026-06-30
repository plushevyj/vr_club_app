part of 'sessions_bloc.dart';

@immutable
sealed class SessionsEvent {
  const SessionsEvent();
}

class GetSessionsEvent extends SessionsEvent {
  const GetSessionsEvent();
}