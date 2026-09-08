import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signUp({required CreateUserEntity user});
  Future<Either<Failure, String>> login({required LoginUserEntity user});
}
