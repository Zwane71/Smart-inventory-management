import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/core/configs/theme/app_theme.dart';
import 'package:flutter_app/presentation/splash/pages/splash.dart';
import 'package:flutter_app/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is fully initialized before running async code
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await inititializeDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S.I.M.S',
      theme: AppTheme.darkTheme,
      home: const SplashPage(),
    );
  }
}
