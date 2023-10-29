String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String numberOnly = r'^[0-9]+$';

class Validators {
  static String? checkFieldEmpty(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? checkPhoneField(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    } else if (!(RegExp(numberOnly).hasMatch(fieldContent) && fieldContent.length == 10)) {
      return 'Invalid phone number';
    }

    return null;
  }

  static String? checkPasswordField(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    } else if (fieldContent.length < 8) {
      return 'The password should be at least 8 digits';
    }

    return null;
  }

  static String? checkConfirmPassword(String? password, String? fieldContent) {
    var checkPassword = checkPasswordField(fieldContent);
    if (checkPassword != null) {
      return checkPassword;
    }

    if (password != fieldContent!) {
      return "Password does not match";
    }
    return null;
  }

  static String? checkEmailField(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(emailRegex).hasMatch(fieldContent)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? checkPinField(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
      // } else if (!(RegExp(emailRegex).hasMatch(fieldContent) && fieldContent.length == 4)) {
    } else if (!(fieldContent.length == 4)) {
      return 'Invalid OTP';
    }
    return null;
  }
}
