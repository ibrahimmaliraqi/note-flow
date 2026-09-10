import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/data/datasources/auth_remote.dart';
import 'package:noteflow/features/auth/data/models/create_user_model.dart';
import 'package:noteflow/features/auth/data/models/login_user_model.dart';
import 'package:noteflow/features/auth/data/models/user_model.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemote authRemote;

  AuthRepoImpl({required this.authRemote});
  @override
  Future<Either<Failure, String>> login({required LoginUserEntity user}) async {
    try {
      final res = await authRemote.login(user: LoginUserModel.fromEntity(user));
      print("sssssss");
      print(res);

      final ress = await getUser(userId: res);
      ress.fold(
        (l) {
          print("llllllll");
          print(l.message);
          ServerFailure("فشل جلب البيانات");
        },
        (r) async {
          print("rrrrrrrrrrr");
          print(r.id);
          await saveUser(user: r);
        },
      );
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required CreateUserEntity user,
  }) async {
    try {
      final res = await authRemote.signUp(
        user: CreateUserModel.fromEntity(user),
      );
      await addUser(user: UserModel.fromEntity(user: res));
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addUser({required UserEntity user}) async {
    await authRemote.addUser(user: UserModel.fromEntity(user: user));
    await saveUser(user: user);
  }

  @override
  Future<Either<Failure, UserEntity>> getUser({required String userId}) async {
    try {
      final res = await authRemote.getUser(userId: userId);
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> saveUser({required UserEntity user}) async {
    try {
      print("ennnnnnnnn");
      print(user.id);
      await authRemote.saveUser(user: UserModel.fromEntity(user: user));
      return right(user);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUser({required UserEntity user}) async {
    try {
      final res = await authRemote.updateUser(
        user: UserModel.fromEntity(user: user),
      );
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
