import 'package:flutter/material.dart';
import 'package:flutter_app/core/configs/assets/app_images.dart';
import 'package:flutter_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image restricted to 3/4 of the screen
          Positioned.fill(
            child: Column(
              children: [
                Flexible(
                  flex: 3, // Top 3/4
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover, // Ensure it scales while maintaining aspect ratio
                        image: AssetImage(AppImages.introBG),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2, // Bottom 1/4 (empty to allow background stacking)
                  child: Container(color: Colors.transparent),
                ),
              ],
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.25),
          ),
          // Logo at the top center of the screen
          Positioned(
            top: 30, // Adjust the top position to your preference
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset(AppVectors.getStartLogo)
            ),
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
