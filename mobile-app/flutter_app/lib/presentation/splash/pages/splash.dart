import 'package:flutter/material.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_app/presentation/auth/pages/signup_or_signin.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center column vertically
          children: [
            SvgPicture.asset(
              AppVectors.logo,
              
            ),
            const SizedBox(height: 20), // Add spacing
            Text(
              '"Simplify Your Stock. Speed Up Your Success."',
              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }

  Future<void> redirect() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context)=> SignupOrSignin(),),);
  }
}