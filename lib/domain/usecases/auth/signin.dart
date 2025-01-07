import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/data/models/auth/signin_user_request.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/models/auth/create_user_request.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {

    return sl<AuthRepository>().signin(params!);

  }

}