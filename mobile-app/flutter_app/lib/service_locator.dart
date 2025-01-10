import 'package:flutter_app/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_app/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_app/domain/repository/auth/auth.dart';
import 'package:flutter_app/domain/usecases/auth/signin.dart';
import 'package:flutter_app/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> inititializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
     AuthFirebaseServiceImpl()
     );

  sl.registerSingleton<AuthRepository>(
     AuthRepositoryImpl()
     );


  sl.registerSingleton<SignupUsecase>(
     SignupUsecase()
     );

  sl.registerSingleton<SigninUsecase>(
     SigninUsecase()
     );

  

}