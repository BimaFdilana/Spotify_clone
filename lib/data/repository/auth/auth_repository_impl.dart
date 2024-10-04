import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/data/models/auth/create_user_req.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {


  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async{
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
