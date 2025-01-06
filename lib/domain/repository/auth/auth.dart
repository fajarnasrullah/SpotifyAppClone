
import '../../../data/models/auth/create_user_request.dart';

abstract class AuthRepository {

  Future<void> signup(CreateUserReq createUserReq);

  Future<void> signin();

}