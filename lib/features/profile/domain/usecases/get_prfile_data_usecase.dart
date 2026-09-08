import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';

class GetProfileDataUsecase {
  final AuthRepo authRepo;

  GetProfileDataUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call({required String userId}) {
    return authRepo.getUser(userId: userId);
  }
}
