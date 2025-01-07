
import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/data/models/auth/signin_user_request.dart';

import '../../../data/models/auth/create_user_request.dart';

abstract class AuthRepository {

  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);

}