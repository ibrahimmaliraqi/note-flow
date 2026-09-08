import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp({required CreateUserEntity user});
  Future<Either<Failure, String>> login({required LoginUserEntity user});
  Future<void> addUser({required UserEntity user});
  Future<Either<Failure, UserEntity>> getUser({required String userId});
  Future<void> saveUser({required UserEntity user});
}
