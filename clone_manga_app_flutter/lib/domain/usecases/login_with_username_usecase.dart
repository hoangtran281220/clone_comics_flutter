import 'package:clone_manga_app_flutter/domain/usecases/params/auth_param.dart';

import '../../app/app.locator.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithUsernameUseCase
    implements UseCaseWithParams<User, LoginWithUsernameParams> {
  final AuthRepository _repository = locator<AuthRepository>();

  @override
  Future<User> execute(LoginWithUsernameParams params) {
    return _repository.loginWithUsername(
      username: params.username,
      password: params.password,
    );
  }
}
