import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';
import '../../features/dashboard/dashboard.dart';
import '../../features/notifications/notifications.dart';
import '../../features/profile/profile.dart';
import '../../features/sessions/sessions.dart';
import '../core.dart';

class AuthRouterRefreshNotifier extends ChangeNotifier {
  AuthRouterRefreshNotifier(AuthBloc authBloc) {
    authBloc.stream.listen((_) {
      notifyListeners();
    });
  }
}

GoRouter createAppRouter(AuthBloc authBloc) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: AuthRouterRefreshNotifier(authBloc),
    redirect: (context, state) {
      final isAuthenticated = authBloc.state is AuthAuthenticated;
      final isLoginRoute = state.matchedLocation == '/login';
      final isProtectedRoute = state.matchedLocation.startsWith('/app');

      if (!isAuthenticated && isProtectedRoute) {
        return '/login';
      }

      if (isAuthenticated && isLoginRoute) {
        return '/app/profile';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: LoginPage(),
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(location: state.matchedLocation, child: child),
        routes: [
          GoRoute(
            path: '/app/profile',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProfilePage(),
              );
            },
          ),
          GoRoute(
            path: '/app/notifications',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: NotificationsPage(),
              );
            },
          ),
          GoRoute(
            path: '/app/dashboard',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: DashboardPage(),
              );
            },
          ),
          GoRoute(
            path: '/app/sessions',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SessionsPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
