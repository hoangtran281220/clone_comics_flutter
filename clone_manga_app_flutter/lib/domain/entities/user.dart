class User {
  final String id;
  final String username;
  final int roleId;
  final String? email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? avatarUrl;

  const User(
      {required this.id,
      required this.username,
      required this.roleId,
      required this.createdAt,
      required this.updatedAt,
      this.email,
      this.avatarUrl});
}
