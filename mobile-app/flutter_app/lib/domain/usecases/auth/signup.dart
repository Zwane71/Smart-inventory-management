import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/data/models/auth/create_user_req.dart';
import 'package:flutter_app/domain/repository/auth/auth.dart';
import 'package:flutter_app/service_locator.dart';

class SignupUsecase implements Usecase<Either,CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq ? params}) {
    return sl<AuthRepository>().signup(params!);
  }


}