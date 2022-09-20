import 'package:flutter/cupertino.dart';

class RegisterBloc extends ChangeNotifier {
  String? userEmail;
  String? userName;
  String? password;

  RegisterBloc() {}

  void typedEmailText(String? emailText) {
    userEmail = emailText;
    notifyListeners();
  }

  void typedUserNameText(String? userNameText) {
    userName = userNameText;
    notifyListeners();
  }

  void typedPasswordText(String? passwordText) {
    password = passwordText;
    notifyListeners();
  }
}
