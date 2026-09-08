import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/data/datasources/auth_remote.dart';
import 'package:noteflow/features/auth/data/models/create_user_model.dart';
import 'package:noteflow/features/auth/data/models/login_user_model.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemote authRemote;

  AuthRepoImpl({required this.authRemote});
  @override
  Future<Either<Failure, String>> login({required LoginUserEntity user}) async {
    try {
      final res = await authRemote.login(user: LoginUserModel.fromEntity(user));
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({
    required CreateUserEntity user,
  }) async {
    try {
      final res = await authRemote.signUp(
        user: CreateUserModel.fromEntity(user),
      );
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
