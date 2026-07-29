class AppValidators {
  AppValidators._();

  static final Map<String, int> phoneLengthByDialCode = {
    '+92': 10,  // Pakistan
    '+91': 10,  // India
    '+971': 9, // UAE
    '+966': 9, // Saudi Arabia
    '+1': 10,  // USA / Canada
    '+44': 10, // UK
  };

  static String? validateRequired(
      String? value, {
        String fieldName = 'Field',
      }) {
    final String input = value?.trim() ?? '';

    if (input.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final String email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Please enter email';
    }

    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Please enter valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final String password = value?.trim() ?? '';

    if (password.isEmpty) {
      return 'Please enter password';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? value,
      String password,
      ) {
    final String confirmPassword = value?.trim() ?? '';

    if (confirmPassword.isEmpty) {
      return 'Please confirm password';
    }

    if (confirmPassword != password.trim()) {
      return 'Password does not match';
    }

    return null;
  }

  static String? validatePhone(
      String? value, {
        required String selectedDialCode,
      }) {
    final String phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Please enter phone number';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return 'Phone number should contain digits only';
    }

    final int requiredLength =
        phoneLengthByDialCode[selectedDialCode] ?? 7;

    if (phone.length != requiredLength) {
      return 'Phone number must be $requiredLength digits for $selectedDialCode';
    }

    return null;
  }
}