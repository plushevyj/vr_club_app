
import '../entities/session.dart';

abstract class SessionsRepository {
  Future<List<Session>> getSessions();
}
