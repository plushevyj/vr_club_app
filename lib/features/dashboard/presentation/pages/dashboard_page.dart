import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth.dart';
import '../../domain/domain.dart';
import '../bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! AuthAuthenticated) {
          return const Center(child: Text('Пользователь не авторизован'));
        }
        final user = state.user;

        context.read<DashboardBloc>().add(GetDashboardEvent());

        return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
          return switch (state) {
            DashboardInitialState() => DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            DashboardLoadingState() => Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(child: CircularProgressIndicator())),
            ErrorDashboardState() => Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: Center(child: Text('Возникла ошибка'))),
            GotDashboardState() => Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 33, 60),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Состояние VR-оборудования в реальном времени',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF989898),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                              width: 76,
                              height: 76,
                              decoration: const BoxDecoration(
                                color: Color(0xFF17652E),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${user.lastName[0]}${user.firstName[0]}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.lastName} ${user.firstName} ${user.patronymic}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      user.roleTranslatedRU,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF989898),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 40,
                          runSpacing: 24,
                          children: [
                            for (final room in state.rooms)
                              _RoomBoardWidget(room: room),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          };
        });
      },
    );
  }
}

class _RoomBoardWidget extends StatelessWidget {
  const _RoomBoardWidget({required this.room});

  final VRRoom room;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF3D3D3D),
        border: Border.all(
          color: const Color(0xFFB2B2B2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                room.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 5,
                backgroundColor: switch (room.status) {
                  DisplayRoomStatus.criticallyLowCharge =>
                    const Color(0xFFD22020),
                  DisplayRoomStatus.lowCharge => const Color(0xFFF0C000),
                  DisplayRoomStatus.occupied => const Color(0xFF3755B7),
                  _ => const Color(0xFF04A957),
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          _StateRoomElementWidget(
            title: 'Очки',
            value: room.helmetCharge,
          ),
          _StateRoomElementWidget(
            title: 'Контроллер Л',
            value: room.leftControllerCharge,
          ),
          _StateRoomElementWidget(
            title: 'Контроллер П',
            value: room.rightControllerCharge,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                switch (room.status) {
                  DisplayRoomStatus.criticallyLowCharge => Icons.error_outline,
                  DisplayRoomStatus.lowCharge => Icons.warning_amber_rounded,
                  DisplayRoomStatus.occupied => Icons.schedule,
                  _ => Icons.check_circle_outline,
                },
                color: switch (room.status) {
                  DisplayRoomStatus.criticallyLowCharge =>
                    const Color(0xFFD22020),
                  DisplayRoomStatus.lowCharge => const Color(0xFFF0C000),
                  DisplayRoomStatus.occupied => const Color(0xFF3755B7),
                  _ => const Color(0xFF04A957),
                },
              ),
              const SizedBox(width: 8),
              Text(
                switch (room.status) {
                  DisplayRoomStatus.criticallyLowCharge ||
                  DisplayRoomStatus.lowCharge =>
                    'Низкий заряд',
                  DisplayRoomStatus.occupied => 'Занято',
                  _ => 'Свободно',
                },
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF989898),
                ),
              )
            ],
          )
        ],
      ), // сюда вставишь свои виджеты
    );
  }
}

class _StateRoomElementWidget extends StatelessWidget {
  const _StateRoomElementWidget({required this.title, required this.value});

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF989898),
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: value / 100,
            minHeight: 8,
            backgroundColor: const Color(0xFF1C1C1C),
            valueColor: AlwaysStoppedAnimation(
              value < 20
                  ? const Color(0xFFD22020)
                  : value < 50
                      ? const Color(0xFFF0C000)
                      : const Color(0xFF04A957),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
