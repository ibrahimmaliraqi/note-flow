import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/profile/domain/usecases/get_prfile_data_usecase.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  final GetProfileDataUsecase getProfileDataUsecase;
  GetProfileDataCubit({required this.getProfileDataUsecase})
    : super(GetProfileDataInitial());
  Future<void> getProfileData({required String userId}) async {
    emit(GetProfileDataLoading());
    final result = await getProfileDataUsecase.call(userId: userId);
    result.fold(
      (failure) => emit(GetProfileDataFailure(message: failure.message)),
      (user) => emit(GetProfileDataSuccess(user: user)),
    );
  }
}
