import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vr_club_app/core/core.dart';
import 'package:vr_club_app/features/auth/auth.dart';
import 'package:vr_club_app/features/dashboard/dashboard.dart';
import 'package:vr_club_app/features/sessions/sessions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(const VrClubApp());
}

class VrClubApp extends StatelessWidget {
  const VrClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => authBloc,
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => sl<DashboardBloc>(),
        ),
         BlocProvider<SessionsBloc>(
          create: (_) => sl<SessionsBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'VR Club Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
          useMaterial3: true,
        ),
        routerConfig: createAppRouter(authBloc),
      ),
    );
  }
}