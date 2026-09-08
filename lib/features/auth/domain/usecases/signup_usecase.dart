import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';

class SignupUsecase {
  final AuthRepo authRepo;

  SignupUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call({required CreateUserEntity user}) {
    return authRepo.signUp(user: user);
  }
}
