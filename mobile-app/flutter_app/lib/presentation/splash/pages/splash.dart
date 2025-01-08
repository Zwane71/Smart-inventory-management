import 'package:flutter/material.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
}