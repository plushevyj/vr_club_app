import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth.dart';
import '../../domain/domain.dart';
import '../bloc/sessions_bloc.dart';
import '../widgets/session_details.dart';
import '../widgets/sessions_table.dart' hide Session;

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  Session? selectedSession;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SessionsBloc>().add(GetSessionsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! AuthAuthenticated) {
          return const Center(child: Text('Пользователь не авторизован'));
        }
        final user = state.user;

        return BlocBuilder<SessionsBloc, SessionsState>(
            builder: (context, state) {
          return switch (state) {
            SessionsInitialState() => DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            SessionsLoadingState() => Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(child: CircularProgressIndicator())),
            ErrorSessionsState() => Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(child: Text('Возникла ошибка'))),
            GotSessionsState() => Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3, // 3/4 ширины
                        child: SessionsTable(
                          sessions: state.sessions,
                          onSessionTap: (session) {
                            setState(() {
                              selectedSession = session;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2, // 1/4 ширины
                        child: SessionDetails(
                          session: selectedSession,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          };
        });
      },
    );
  }
}
