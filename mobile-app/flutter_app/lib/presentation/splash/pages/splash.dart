import 'package:flutter/material.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_app/presentation/auth/pages/signup_or_signin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0; // Initial opacity set to 0 (fully transparent)

  @override
  void initState() {
    super.initState();
    _fadeIn(); // Start fade-in effect
    redirect(); // Redirect after delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center column vertically
          children: [
            AnimatedOpacity(
              opacity: _opacity, // Control opacity here
              duration: const Duration(seconds: 2), // Duration of the fade-in effect
              child: SvgPicture.asset(
                AppVectors.logo,
              ),
            ),
            const SizedBox(height: 20), // Add spacing
            AnimatedOpacity(
              opacity: _opacity, // Control opacity here
              duration: const Duration(seconds: 2),
              child: Text(
                '"Simplify Your Stock. Speed Up Your Success."',
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 5)); // Wait for both fade-in and fade-out
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => const SignupOrSignin(),
      ),
    );
  }

  // Function to trigger fade-in and fade-out effect
  void _fadeIn() {
    // Fade-in effect
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0; // Fade to fully opaque after 1 second
      });

      // Fade-out effect after fade-in completes
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _opacity = 0.0; // Fade out after 2 seconds
        });
      });
    });
  }
}
