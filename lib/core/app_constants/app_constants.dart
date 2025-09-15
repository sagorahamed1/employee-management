class AppConstants {

  static final String role = "role";
  static final String bearerToken = "bearerToken";
  static final String email = "email";
  static final String name = "name";
  static final String number = "number";
  static final String userId = "userId";
  static final String isLogged = "isLogged";
  static final String image = "image";
  static final String address = "address";
  static final String dateOfBirth = "dateOfBirth";
  static final String rating = "rating";


  static RegExp emailValidate = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static bool validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$');
    return regex.hasMatch(value);
  }
}