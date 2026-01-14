import '../../../dtos/user_dto.dart';

abstract class AuthRemoteDatasource {
  Future<UserDto> loginWithUsername({
    required String username,
    required String password,
  });

  Future<UserDto> loginWithGoogle();

  Future<UserDto> register({
    required String username,
    required String password,
  });

  Future<UserDto?> getCurrentUser();

  Future<void> logout();
}
