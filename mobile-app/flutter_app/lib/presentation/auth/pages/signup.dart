import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_app/presentation/auth/pages/signin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
     final ButtonStyle signupButtonStyle = ElevatedButton.styleFrom(
      
      minimumSize: const Size(78, 40),
    );
    return Scaffold(
      appBar: BasicAppBar(
      
        title: Text(
          'Sign Up',
          style: GoogleFonts.inter(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              
              child: Text(
                '"Sign in to manage your \ninventory with realtime \n tracking"',
                style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40, vertical: 30), // Add padding
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9).withOpacity(0.44),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    width: 220,
                    height: 90,
                      child: SvgPicture.asset(
                    AppVectors.logo,
                    
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  _FirstNameField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _lastNameField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _emailField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _passwordField(),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                              style: signupButtonStyle,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SignupPage() ));
                              },
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                    const SizedBox(height: 20,),
                   _signInText(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _FirstNameField() {
    return TextField(
      decoration: const InputDecoration(hintText: 'First Name'),
    );
  }

  Widget _lastNameField() {
    return TextField(
      decoration: const InputDecoration(hintText: 'Last Name'),
    );
  }

  Widget _emailField() {
    return TextField(
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have account? ',
          style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14, color: Colors.black ),
        ),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SigninPage() ),);
        }, child: Text('Log in'))
      ],
    );
  }
}
