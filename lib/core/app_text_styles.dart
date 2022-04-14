import 'package:flutter/material.dart';
import 'package:gac/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle splashTitle = GoogleFonts.russoOne(
    fontSize: 96,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 14.5,
  );

  static final TextStyle splashSubtitle = GoogleFonts.russoOne(
    fontSize: 18,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 2.5,
  );

  static final TextStyle editText = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final TextStyle buttonText = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.buttonColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
