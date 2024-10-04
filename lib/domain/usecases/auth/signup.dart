import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/core/usecase/usecase.dart';
import 'package:spotify_flutter/data/models/auth/create_user_req.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {

  @override
 Future<Either> call ({CreateUserReq ? params}) {
   return sl<AuthRepository>().signup(params!);
  }
}