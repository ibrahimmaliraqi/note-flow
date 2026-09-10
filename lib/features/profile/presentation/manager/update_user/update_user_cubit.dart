import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/usecases/update_user_usecase.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final UpdateUserUsecase updateUserUsecase;
  UpdateUserCubit({required this.updateUserUsecase})
    : super(UpdateUserInitial());
  Future<void> updateUser({required UserEntity user}) async {
    emit(UpdateUserLoading());
    final result = await updateUserUsecase.call(user: user);
    result.fold(
      (failure) => emit(UpdateUserFailure(message: failure.message)),
      (message) => emit(UpdateUserSuccess(message: message)),
    );
  }
}
