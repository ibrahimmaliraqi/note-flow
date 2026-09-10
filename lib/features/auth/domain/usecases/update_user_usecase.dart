import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';

class UpdateUserUsecase {
  final AuthRepo authRepo;

  UpdateUserUsecase({required this.authRepo});
  Future<Either<Failure, String>> call({required UserEntity user}) async {
    return await authRepo.updateUser(user: user);
  }
}
