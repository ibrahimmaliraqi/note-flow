import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/auth/domain/entities/create_user_entity.dart';
import 'package:noteflow/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupUsecase signUpUseCase;

  SignUpCubit({
    required this.signUpUseCase,
  }) : super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    final user = CreateUserEntity(
      name: name,
      email: email,
      password: password,
    );

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
