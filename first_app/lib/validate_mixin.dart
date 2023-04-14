// ignore_for_file: unnecessary_null_comparison

class ValidateMixin {
  String? validateEmail(String? value) {
    // if (!value!.contains('@')) {
    //   return 'Enter valid Email Address';
    // }
    // retur n null;

    String? pattern =
        // r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        // r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        // r"{0,253}[a-zA-Z0-9])?)*$";
        r'^[a-zA-Z0-9+_.-]+[@][a-zA-Z0-9.-]+.[a-z]';
    // r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!) || value == null) {
      return 'Hey...Enter a valid email address';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 5) {
      return 'Entered Password must be having minimum 5 characters';
    }
    return null;
  }
}
