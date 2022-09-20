import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:flutter/cupertino.dart';

class RegisterBloc extends ChangeNotifier {
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  String? userEmail;
  String? userName;
  String? password;

  bool isLoading = false;

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

  Future onTapRegister() {
    isLoading = true;
    notifyListeners();
    return authenticationModel
        .registerNewUser(userName ?? "", userEmail ?? "", password ?? "")
        .whenComplete(() => isLoading = false);
  }
}
