import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/domain.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardUseCase dashboardUseCase;

  DashboardBloc(this.dashboardUseCase) : super(DashboardInitialState()) {
    print(this.state);
    on<GetDashboardEvent>(_onGetDashboardEvent);
  }

  void _onGetDashboardEvent(GetDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());
    try {
      await Future.delayed(Duration(seconds: 2));
      final vrRooms = await dashboardUseCase();
      emit(GotDashboardState(rooms: vrRooms));
    } catch (e) {
      emit(ErrorDashboardState(error: e.toString()));
    }
  }
}
