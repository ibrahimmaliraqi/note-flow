import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';
import 'package:noteflow/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final user = LoginUserEntity(
      email: email,
      password: password,
    );

    final result = await loginUseCase.call(user: user);

    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }
}
