import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_app/core/configs/theme/app_colors.dart';
import 'package:flutter_app/data/models/auth/create_user_req.dart';
import 'package:flutter_app/domain/usecases/auth/signup.dart';
import 'package:flutter_app/presentation/auth/pages/signin.dart';
import 'package:flutter_app/presentation/route/pages/root.dart';
import 'package:flutter_app/service_locator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 30
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
                    _fullNameField(),
                    const SizedBox(
                      height: 10,
                    ),
                    _emailField(),
                    const SizedBox(
                      height: 10,
                    ),
                    _passwordField(),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: signupButtonStyle,
                      onPressed: () async {
                        var results = await sl<SignupUsecase>().call(
                            params: CreateUserReq(
                          fullName: widget._fullName.text.toString(),
                          email: widget._email.text.toString(),
                          password: widget._password.text.toString(),
                        ));
                        results.fold(
                          (l){ 
                            var snackbar = SnackBar(content: Text(l));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          },
                          (r){
                            Navigator.pushAndRemoveUntil(
                              context, 
                              MaterialPageRoute(builder: (BuildContext context) => const RootPAge()), 
                              (route) => false,);
                           },
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _signInText(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fullNameField() {
    return TextField(
      controller: widget._fullName,
      decoration: const InputDecoration(hintText: 'First Name'),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: widget._email,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: widget._password,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have account? ',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SigninPage()),
              );
            },
            child: Text(
              'Log in',
              style: GoogleFonts.lato(color: AppColors.primary),
            ))
      ],
    );
  }
}
