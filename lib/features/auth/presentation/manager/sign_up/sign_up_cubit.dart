import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupUsecase signUpUseCase;

  SignUpCubit({
    required this.signUpUseCase,
  }) : super(SignUpInitial());

  Future<void> signUp({required CreateUserEntity user}) async {
    emit(SignUpLoading());

    final result = await signUpUseCase(
      user: user,
    );

    result.fold(
      (failure) {
        emit(
          SignUpFailure(failure.message),
        );
      },
      (user) {
        emit(
          SignUpSuccess(user),
        );
      },
    );
  }
}
