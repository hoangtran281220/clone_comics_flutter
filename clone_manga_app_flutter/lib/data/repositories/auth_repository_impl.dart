import 'package:clone_manga_app_flutter/data/datasource/remote/firebase/auth_remote_datasource.dart';
import 'package:clone_manga_app_flutter/data/mapper/user_mapper.dart';
import 'package:clone_manga_app_flutter/domain/entities/user.dart';
import 'package:clone_manga_app_flutter/domain/repositories/auth_repository.dart';

import '../../app/app.locator.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../dtos/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource =
      locator<AuthRemoteDatasource>();
  final AuthLocalDatasource _localDatasource = locator<AuthLocalDatasource>();
  final UserMapper _mapper = locator<UserMapper>();

  @override
  Future<User?> getCurrentUser() async {
    // TODO: implement getCurrentUser
    final dto = await _remoteDatasource.getCurrentUser();
    if (dto == null) return null;
    await _localDatasource.saveUserId(dto.id);

    return _mapper.map(dto);
  }

  @override
  Future<User> loginWithGoogle() async {
    final UserDto dto = await _remoteDatasource.loginWithGoogle();

    await _localDatasource.saveUserId(dto.id);

    return _mapper.map(dto);
  }

  @override
  Future<User> loginWithUsername({
    required String username,
    required String password,
  }) async {
    final UserDto dto = await _remoteDatasource.loginWithUsername(
      username: username,
      password: password,
    );

    await _localDatasource.saveUserId(dto.id);

    return _mapper.map(dto);
  }

  @override
  Future<void> logout() async {
    await _remoteDatasource.logout();
    await _localDatasource.clear();
  }

  @override
  Future<User> register({
    required String username,
    required String password,
  }) async {
    final UserDto dto = await _remoteDatasource.register(
      username: username,
      password: password,
    );

    await _localDatasource.saveUserId(dto.id);

    return _mapper.map(dto);
  }
}
