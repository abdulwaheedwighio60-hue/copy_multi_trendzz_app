import 'dart:ui';

class AppColors {
  // Brand Colors
  static const Color primaryColor = Color(0xFFFF4747);
  static const Color primaryLight = Color(0xFFFFE5E5);
  static const Color primaryDark = Color(0xFFD93636);

  // Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);

  // Text Colors
  static const Color darkColor = Color(0xFF242424);
  static const Color lightColor = Color(0xFFF6F6F6);

  static const Color textPrimary = Color(0xFF242424);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textHint = Color(0xFF9E9E9E);

  // Neutral Colors
  static const Color greyColor = Color(0xFF797979);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color dividerColor = Color(0xFFEEEEEE);

  // Status Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);

  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);

  static const Color warning = Color(0xFFF9A825);
  static const Color warningLight = Color(0xFFFFF8E1);

  static const Color info = Color(0xFF0288D1);
  static const Color infoLight = Color(0xFFE1F5FE);

  // Snackbar
  static const Color snackBarSuccess = Color(0xFF2E7D32);
  static const Color snackBarError = Color(0xFFD32F2F);
  static const Color snackBarWarning = Color(0xFFF9A825);
  static const Color snackBarInfo = Color(0xFF0288D1);

  // Others
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color transparent = Color(0x00000000);

  // Disable
  static const Color disabled = Color(0xFFBDBDBD);

  // Shadow
  static const Color shadow = Color(0x1A000000);

  static final Color inputFieldColor = textHint.withOpacity(0.15);
}