class UserEntity {
  final String id;
  final String name;
  final String email;
  final String createAt;
  final String? image;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.createAt,
    required this.image,
  });
}
