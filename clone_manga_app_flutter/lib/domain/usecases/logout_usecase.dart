import '../../app/app.locator.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<void> {
  final AuthRepository _repository = locator<AuthRepository>();

  @override
  Future<void> execute() {
    return _repository.logout();
  }
}
