import 'package:flutter/cupertino.dart';

class LoginBloc extends ChangeNotifier {
  String? userEmail;
  String? password;

  LoginBloc() {}

  void typedEmailText(String? emailText) {
    userEmail = emailText;
    notifyListeners();
  }

  void typedPasswordText(String? passwordText) {
    password = passwordText;
    notifyListeners();
  }
}
