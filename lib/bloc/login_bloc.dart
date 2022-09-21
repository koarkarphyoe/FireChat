import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc extends ChangeNotifier {
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  String? userEmail;
  String? password;

  bool isLoading = false;

  LoginBloc() {}

  Future<void> onTapLogin() {
    showLoading();
    return authenticationModel
        .login(userEmail ?? "", password ?? "")
        .whenComplete(() => hideLoading());
  }

  void typedEmailText(String? emailText) {
    userEmail = emailText;
    notifyListeners();
  }

  void typedPasswordText(String? passwordText) {
    password = passwordText;
    notifyListeners();
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
