
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app_clone/data/models/auth/signin_user_request.dart';

import '../../models/auth/create_user_request.dart';

abstract class AuthFirebaseService {

  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);

}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email,
          password: signinUserReq.password
      );

      return const Right('Sign In was Successful');

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'User not found';
      } else if (e.code == 'invalid-credential') {
        message = 'Password incorrect';
      }

      return Left(message);

    }

  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password
      );

      return const Right('Sign Up was Successful');

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Account is already exists';
      }

      return Left(message);

    }
  }

}