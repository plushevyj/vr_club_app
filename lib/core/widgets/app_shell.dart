import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';

class AppShell extends StatelessWidget {
  final String location;
  final Widget child;

  const AppShell({
    super.key,
    required this.location,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = switch (location) {
      '/app/dashboard' => 0,
      '/app/profile' => 1,
      '/app/notifications' => 2,
      _ => 0,
    };

    final state = context.read<AuthBloc>().state;
    if (state is! AuthAuthenticated) {
      return const Center(child: Text('Пользователь не авторизован'));
    }

    final user = state.user;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 92,
            child: Row(
              children: [
                Container(
                  width: 360,
                  color: const Color(0xFF3D3D3D),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A50B1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'ИС',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ИС Арена',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Управление VR-клубом',
                            style: TextStyle(
                              color: Color(0xFF989898),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(
                  child: Container(
                    height: 92,
                    color: const Color(0xFF3D3D3D),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (() {
                            switch (selectedIndex) {
                              case 0:
                                return 'Дашборд';
                              case 1:
                                return 'Профиль';
                              case 2:
                                return 'Уведомления';
                              default:
                                return '';
                            }
                          })(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${user.firstName} ${user.lastName[0]}. ${user.patronymic[0]}.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
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
                            const SizedBox(width: 6),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Color(0xFF17652E),
                              child: Text('${user.firstName[0]}${user.lastName[0]}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 360,
                  color: const Color(0xFF3D3D3D),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      _NavButton(
                        icon: Icons.dashboard_outlined,
                        selectedIcon: Icons.dashboard_outlined,
                        title: 'Дашборд',
                        selected: selectedIndex == 0,
                        onTap: () => context.go('/app/dashboard'),
                      ),
                      const SizedBox(height: 24),
                      const Divider(height: 1, thickness: 1),
                      const SizedBox(height: 24),
                      _NavButton(
                        icon: Icons.person_outline,
                        selectedIcon: Icons.person_outline,
                        title: 'Профиль',
                        selected: selectedIndex == 1,
                        onTap: () => context.go('/app/profile'),
                      ),
                      _NavButton(
                        icon: Icons.notifications_outlined,
                        selectedIcon: Icons.notifications_outlined,
                        title: 'Уведомления',
                        selected: selectedIndex == 2,
                        onTap: () => context.go('/app/notifications'),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          selected ? Colors.blue.withValues(alpha: 0.15) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: selected ? Color(0xFFEBF7FF) : Colors.transparent,
            border: selected
                ? Border(
                    left: BorderSide(
                      color: Color(0xFF1646AE),
                      width: 4,
                    ),
                  )
                : null,
          ),
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  selected ? selectedIcon : icon,
                  color: selected ? Color(0xFF1646AE) : Color(0xFF989898),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: selected ? Color(0xFF1646AE) : Color(0xFF989898),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
