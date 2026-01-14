import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> loginWithUsername({
    required String username,
    required String password,
  });

  Future<User> loginWithGoogle();

  Future<User> register({
    required String username,
    required String password,
  });

  Future<User?> getCurrentUser();

  Future<void> logout();
}
