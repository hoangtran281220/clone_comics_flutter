// data/dtos/user_dto.dart
class UserDto {
  final String id;
  final String? email;
  final String userName;
  final String? avatarUrl;

  // Firestore-specific fields (nếu có, nhưng vẫn là data)
  final DateTime createdAt;
  final DateTime updatedAt;
  final int roleId;

  const UserDto({
    required this.id,
    this.email,
    required this.userName,
    this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
  });
}
