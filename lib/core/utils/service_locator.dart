import 'package:get_it/get_it.dart';
import 'package:noteflow/features/auth/data/datasources/auth_remote.dart';
import 'package:noteflow/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:noteflow/features/auth/domain/repositories/auth_repo.dart';
import 'package:noteflow/features/auth/domain/usecases/login_usecase.dart';
import 'package:noteflow/features/auth/domain/usecases/signup_usecase.dart';
import 'package:noteflow/features/auth/domain/usecases/update_user_usecase.dart';
import 'package:noteflow/features/home/data/datasources/home_remote.dart';
import 'package:noteflow/features/home/data/repositories/home_repo_impl.dart';
import 'package:noteflow/features/home/domain/repositories/home_repo.dart';
import 'package:noteflow/features/home/domain/usecases/add_note_usecase.dart';
import 'package:noteflow/features/home/domain/usecases/get_notes_usercase.dart';
import 'package:noteflow/features/profile/domain/usecases/get_prfile_data_usecase.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //service
  getIt.registerSingleton<AuthRemote>(AuthFirebaseDataSource());
  getIt.registerSingleton<HomeRemote>(HomeFirebaseRemoteImpl());
  //repo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemote: getIt.get<AuthRemote>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(homeRemote: getIt.get<HomeRemote>()),
  );

  //use case
  getIt.registerSingleton<SignupUsecase>(
    SignupUsecase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<LoginUsecase>(
    LoginUsecase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<AddNoteUsecase>(
    AddNoteUsecase(homeRepo: getIt.get<HomeRepo>()),
  );
  getIt.registerSingleton<GetNotesUsercase>(
    GetNotesUsercase(homeRepo: getIt.get<HomeRepo>()),
  );
  getIt.registerSingleton<GetProfileDataUsecase>(
    GetProfileDataUsecase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<UpdateUserUsecase>(
    UpdateUserUsecase(authRepo: getIt.get<AuthRepo>()),
  );
}
