

import 'package:get_it/get_it.dart';
import 'package:spotify_app_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_app_clone/domain/usecases/auth/signup.dart';

import 'data/repository/auth/auth_repo_impl.dart';
import 'data/sources/auth/auth_firebase_service.dart';
import 'domain/repository/auth/auth.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService> (
      AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository> (
      AuthRepositoryImpl()
  );
  
  sl.registerSingleton<SignupUseCase> (
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase> (
    SigninUseCase()
  );

}