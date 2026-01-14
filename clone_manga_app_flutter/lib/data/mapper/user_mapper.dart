import '../../core/mapper/mapper.dart';
import '../../domain/entities/user.dart';
import '../dtos/user_dto.dart';

class UserMapper implements Mapper<UserDto, User> {
  @override
  User map(UserDto dto) {
    return User(
      id: dto.id,
      email: dto.email,
      username: dto.userName,
      avatarUrl: dto.avatarUrl,
      roleId: dto.roleId,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
