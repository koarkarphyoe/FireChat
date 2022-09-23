import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc extends ChangeNotifier {
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  String? userEmail;
  String? password;

  bool isLoading = false;
  bool isLoginError = false;
  String? loginErrorMessage = "";

  LoginBloc() {}

  Future<void> onTapLogin() {
    showLoading();
    return authenticationModel
        .login(userEmail ?? "", password ?? "")
        .onError((error, stackTrace) {
      loginErrorMessage = error.toString();
      isLoginError = true;
      notifyListeners();
    }).whenComplete(() => hideLoading());
  }

  void typedEmailText(String? emailText) {
    userEmail = emailText;
    isLoginError = false;
    notifyListeners();
  }

  void typedPasswordText(String? passwordText) {
    password = passwordText;
    isLoginError = false;
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
