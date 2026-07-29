import 'package:multi_trendzz/core/utils/app_validators.dart';

class AppHelper {
  AppHelper._();

  /// Returns phone number hint based on selected country dial code.
  static String getPhoneHintText(String selectedDialCode) {
    switch (selectedDialCode) {
      case '+92':
        return '3001234567';

      case '+91':
        return '9876543210';

      case '+971':
        return '501234567';

      case '+966':
        return '501234567';

      case '+1':
        return '2025550188';

      case '+44':
        return '7123456789';

      default:
        return 'Enter phone number';
    }
  }

  /// Returns max phone number length based on selected country.
  static int getPhoneMaxLength(String selectedDialCode) {
    return AppValidators.phoneLengthByDialCode[selectedDialCode] ?? 10;
  }
}