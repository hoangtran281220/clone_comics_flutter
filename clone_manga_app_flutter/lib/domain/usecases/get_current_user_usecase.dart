import '../../app/app.locator.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase implements UseCase<User?> {
  final AuthRepository _repository = locator<AuthRepository>();

  @override
  Future<User?> execute() {
    return _repository.getCurrentUser();
  }
}
