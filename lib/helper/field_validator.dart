class FieldValidator {

  static String validateEmail(String value) {
    if(value.isEmpty) return 'Email is Required';

    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final emailCheck = RegExp(pattern);
    if (!emailCheck.hasMatch(value)) return 'Invalid email';

    return null;
  }

  static String validatePassword(String value) {
    if(value.isEmpty) return 'Password is Required';

    Pattern pattern = r'^.{6,}$';
    final alphanumeric = RegExp(pattern);
    if (!alphanumeric.hasMatch(value))
      return 'Password Should at Least 6 Character';

    return null;
  }

  static String validateFirstName(String value) {
    if(value.isEmpty) return 'First Name is Required';
    return null;
  }

  static String validateLastName(String value) {
    if(value.isEmpty) return 'Last Name is Required';
    return null;
  }

  static String validateConfirmPassword(String password, String confirmPassword) {

    if(password != confirmPassword) return 'Password not match';
    return null;
  }
}