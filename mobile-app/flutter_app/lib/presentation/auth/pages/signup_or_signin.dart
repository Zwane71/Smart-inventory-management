import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_app/core/configs/assets/app_images.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupOrSignin extends StatefulWidget {
  const SignupOrSignin({super.key});

  @override
  State<SignupOrSignin> createState() => _SignupOrSigninState();
}

class _SignupOrSigninState extends State<SignupOrSignin> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle signinButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Color(0xff2B2E4A),
      foregroundColor: Colors.white,
      minimumSize: Size(78, 40),
    );
    final ButtonStyle signupButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xff2B2E4A),
      minimumSize: Size(78, 40),
    );
    return Scaffold(
      // appBar: const BasicAppBar(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Text(
                  'Smart Inventory Management System',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(AppImages.introBG),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 30), // Add padding
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.14),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '“Discover a smarter way to \nmanage your inventory with IoT!”',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center buttons in the row
                        children: [
                          ElevatedButton(
                            style: signinButtonStyle,
                            onPressed: () {},
                            child: Text(
                              'Sign in',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 10), // Add space between buttons
                          ElevatedButton(
                            style: signupButtonStyle,
                            onPressed: () {},
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
