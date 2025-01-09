import 'package:flutter/material.dart';
import 'package:flutter_app/core/configs/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

 static final LightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.defaultBackground,
  brightness: Brightness.light,
   inputDecorationTheme: InputDecorationTheme(
    hintStyle:  GoogleFonts.lato(color: Color(0xff808080),fontWeight: FontWeight.w500),
    filled: true,
    fillColor: Color(0xffD9D9D9).withOpacity(0.5),
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15)
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ) 
    )
  )
 );

  static final darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle:  GoogleFonts.lato(color: Color(0xff808080),fontWeight: FontWeight.w500),
    filled: true,
    fillColor: Colors.white.withOpacity(0.5),
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15)
    )
  ),
  scaffoldBackgroundColor: AppColors.choiceBackround,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      textStyle: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ) 
    )
  )
 ); 
}