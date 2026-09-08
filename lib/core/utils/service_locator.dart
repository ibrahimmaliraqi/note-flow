import 'package:get_it/get_it.dart';
import 'package:noteflow/features/auth/data/datasources/auth_remote.dart';
import 'package:noteflow/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';
import 'package:noteflow/features/auth/domain/usecases/login_usecase.dart';
import 'package:noteflow/features/auth/domain/usecases/signup_usecase.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //service
  getIt.registerSingleton<AuthRemote>(AuthFirebaseDataSource());
  //repo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemote: getIt.get<AuthRemote>()),
  );

  //use case
  getIt.registerSingleton<SignupUsecase>(
    SignupUsecase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<LoginUsecase>(
    LoginUsecase(authRepo: getIt.get<AuthRepo>()),
  );
}
