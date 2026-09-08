// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:noteflow/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.createAt,
    required super.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'createAt': createAt,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      createAt: map['createAt'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
}
