abstract class AuthLocalDatasource {
  Future<void> saveUserId(String uid);
  Future<String?> getUserId();
  Future<void> clear();
}
