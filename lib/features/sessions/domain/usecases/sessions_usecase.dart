import '../entities/session.dart';
import '../repositories/sessions_repository.dart';

class SessionsUseCase {
  final SessionsRepository repository;

  SessionsUseCase(this.repository);

  Future<List<Session>> call() async {
    return repository.getSessions();
  }
}
