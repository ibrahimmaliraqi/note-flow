// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  LoginUserModel({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
