import 'package:get_it/get_it.dart';

import '../../features/auth/auth.dart';
import '../../features/dashboard/dashboard.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(AuthFixtureDataSource()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(sl<AuthRepository>()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<LoginUseCase>()));

  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(DashboardFixtureDataSource()));
  sl.registerLazySingleton<DashboardUseCase>(
      () => DashboardUseCase(sl<DashboardRepository>()));
  sl.registerFactory<DashboardBloc>(() => DashboardBloc(sl<DashboardUseCase>()));
}
