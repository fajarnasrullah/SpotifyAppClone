import '../../../domain/repository/auth/auth.dart';
import '../../../service_locator.dart';
import '../../models/auth/create_user_request.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq)  async {

    await sl<AuthFirebaseService>().signup(createUserReq);
  }

}