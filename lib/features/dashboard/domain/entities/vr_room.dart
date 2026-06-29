enum DisplayRoomStatus {
  vacant,
  occupied,
  lowCharge,
  criticallyLowCharge,
}

class VRRoom {
  const VRRoom({
    required this.id,
    required this.name,
    required this.helmetCharge,
    required this.leftControllerCharge,
    required this.rightControllerCharge,
    required this.status,
  });

  final String id;
  final String name;
  final int helmetCharge;
  final int leftControllerCharge;
  final int rightControllerCharge;
  final DisplayRoomStatus status;
}
