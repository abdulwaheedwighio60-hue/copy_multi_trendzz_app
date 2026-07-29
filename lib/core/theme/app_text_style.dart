import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle displayLarge = GoogleFonts.inter(
    fontSize: AppFontSizes.s32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: AppFontSizes.s24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: AppFontSizes.s20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: AppFontSizes.s18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle button = GoogleFonts.inter(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: AppFontSizes.s10,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}