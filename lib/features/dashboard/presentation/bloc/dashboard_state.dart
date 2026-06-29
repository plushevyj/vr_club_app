part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {
  const DashboardState();
}

final class DashboardInitialState extends DashboardState {
  const DashboardInitialState();
}

final class DashboardLoadingState extends DashboardState {
  const DashboardLoadingState();
}

final class GotDashboardState extends DashboardState {
  final List<VRRoom> rooms;

  const GotDashboardState({required this.rooms});
}

final class ErrorDashboardState extends DashboardState {
  final String error;

  const ErrorDashboardState({required this.error});
}
