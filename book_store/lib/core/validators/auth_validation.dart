
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Validators{
  static String? validateEmail(String? email) {

    if (email == null || email.trim().isEmpty) {
      return LocaleKeys.email_required.tr();//"Email is required";
    }

    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      return LocaleKeys.invalid_email_format.tr();//"Invalid email format";
    }

    return null;
  }
  static  String? validatePassword(String? password) {

    if (password == null || password.isEmpty) {
      return LocaleKeys.password_required.tr();//"Password is required";
    }

    if (password.length < 8) {
      return LocaleKeys.password_min_length.tr();
      //"Password must be at least 8 characters";
    }

    return null;
  }

static  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return LocaleKeys.confirm_password_required.tr();
      //"Confirm password is required";
    }

    if (confirmPassword != password) {
      return LocaleKeys.passwords_do_not_match.tr();
     //   "Passwords do not match";
    }

    return null;
  }
  static String? validateUsername(String? username) {
    if (username == null || username.trim().isEmpty) {
      return LocaleKeys.username_required.tr();
       // "Username is required";
    }
    return null;
  }

  static String? validateEgyptPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone is required";
    }

    final regex = RegExp(r'^01[0125][0-9]{8}$');

    if (!regex.hasMatch(value)) {
      return "Enter a valid Egyptian phone number";
    }

    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is required";
    }

    if (value.length < 10) {
      return "Address is too short";
    }

    return null;
  }

  static String? validateGovernorate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a governorate";
    }
    return null;
  }
}
