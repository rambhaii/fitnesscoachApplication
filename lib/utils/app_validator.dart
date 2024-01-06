import 'package:flutter/material.dart';

class AppValidator {
  BuildContext? context;
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter email address";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return "please enter valid email address";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    //Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:
    if (value!.isEmpty) {
      return "please enter your password";
    }
    // else if (!RegExp(
    //         r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@#$!%*?&]{8,}$")
    //     .hasMatch(value.trim())) {
    //   return "please enter vaild password";
    // }
    return null;
  }

  static String? confirm_passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter confirm password ";
    } else if (value.length < 5) {
      return "password must be the same";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your name ";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? lastnameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your name";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? mobileValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter phone number ";
    } else if (value.length < 10) {
      return "enter a valid phone number";
    }
    return null;
  }

  static String? currentpasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your current password";
    } else if (value.length < 5) {
      return "password must be the same";
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter some text";
    }
    return null;
  }
}
