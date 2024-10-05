import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/core/usecase/usecase.dart';
import 'package:spotify_flutter/data/models/auth/signin_user_req.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {

  @override
 Future<Either> call ({SigninUserReq ? params}) {
   return sl<AuthRepository>().signin(params!);
  }
}