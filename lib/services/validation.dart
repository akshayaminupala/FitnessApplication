import 'package:email_validator/email_validator.dart';

class Validation {
  static Function validateEmail = (email) {
    try {
      assert(EmailValidator.validate(email));
      return null;
    } catch (e) {
      return "Please enter a valid email id";
    }
  };

  static Function validatePassowrd = (password) {
    try {
      if (password.length < 6) {
        throw Error();
      }
      return null;
    } catch (e) {
      return "Password must be 6 characters long";
    }
  };

  static Function validateName = () {
    return null;
  };
}
