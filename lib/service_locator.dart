

import 'package:get_it/get_it.dart';

import 'data/repository/auth/auth_repo_impl.dart';
import 'data/sources/auth/auth_firebase_service.dart';
import 'domain/repository/auth/auth.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  sl.registerSingleton<AuthFirebaseService> (
      AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository> (
      AuthRepositoryImpl()
  );

}