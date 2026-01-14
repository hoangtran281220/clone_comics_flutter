import 'package:clone_manga_app_flutter/domain/usecases/params/auth_param.dart';

import '../../app/app.locator.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase implements UseCaseWithParams<User, RegisterParams> {
  final AuthRepository _repository = locator<AuthRepository>();

  @override
  Future<User> execute(RegisterParams params) {
    return _repository.register(
      username: params.username,
      password: params.password,
    );
  }
}
