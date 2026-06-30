import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/domain.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  final SessionsUseCase sessionsUseCase;

  SessionsBloc(this.sessionsUseCase) : super(SessionsInitialState()) {
    on<GetSessionsEvent>(_onGetSessionsEvent);
  }

  void _onGetSessionsEvent(GetSessionsEvent event, Emitter<SessionsState> emit) async {
    emit(SessionsLoadingState());
    try {
      await Future.delayed(Duration(seconds: 2));
      final sessions = await sessionsUseCase();
      emit(GotSessionsState(sessions: sessions));
    } catch (e) {
      emit(ErrorSessionsState(error: e.toString()));
    }
  }
}
