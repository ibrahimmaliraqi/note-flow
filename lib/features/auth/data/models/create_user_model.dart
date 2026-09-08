// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';

class CreateUserModel extends CreateUserEntity {
  CreateUserModel({
    required super.name,
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory CreateUserModel.fromEntity(CreateUserEntity entity) {
    return CreateUserModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }
  factory CreateUserModel.fromMap(Map<String, dynamic> map) {
    return CreateUserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
