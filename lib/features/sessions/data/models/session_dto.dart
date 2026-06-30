class SessionDTO {
  const SessionDTO({
    required this.id,
    required this.client,
    required this.room,
    required this.equipment,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  final String id;
  final String client;
  final String room;
  final String equipment;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
}
