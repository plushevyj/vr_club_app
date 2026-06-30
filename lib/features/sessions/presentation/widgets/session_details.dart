import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({
    super.key,
    required this.session,
  });

  final Session? session;

  @override
  Widget build(BuildContext context) {
    if (session == null) {
      return const Center(
        child: Text('Выберите сеанс'),
      );
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF131A24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Детали сеанса'),
          const SizedBox(height: 18),
          Text('ID: ${session!.id}'),
          const SizedBox(height: 12),
          Text(
            'Клиент: ${session!.client}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Комната: ${session!.room}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Оборудование: ${session!.equipment}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Начало: ${_formatDateTime(session!.startTime)}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Окончание: ${_formatDateTime(session!.endTime)}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Длительность: ${_formatDuration(session!.endTime.difference(session!.startTime))}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE0E0E0),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Статус: ',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE0E0E0),
                ),
              ),
              SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFF082e25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  session!.status,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF086c42),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _formatDateTime(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}.'
      '${dt.month.toString().padLeft(2, '0')}.'
      '${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';

  static String _formatDuration(Duration duration) {
    final h = duration.inHours;
    final m = duration.inMinutes.remainder(60);

    return '${h.toString().padLeft(2, '0')} ч ${m.toString().padLeft(2, '0')} мин';
  }
}
