part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {
  const DashboardEvent();
}

class GetDashboardEvent extends DashboardEvent {
  const GetDashboardEvent();
}