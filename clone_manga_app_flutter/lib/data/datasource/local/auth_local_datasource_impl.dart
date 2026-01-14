import 'package:clone_manga_app_flutter/data/datasource/local/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  static const _keyUserId = 'auth_user_id';

  @override
  Future<void> clear() async {
    // TODO: implement clear
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
  }

  @override
  Future<String?> getUserId() async {
    // TODO: implement getUserId
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserId);
  }

  @override
  Future<void> saveUserId(String uid) async {
    // TODO: implement saveUserId
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, uid);
  }
}
