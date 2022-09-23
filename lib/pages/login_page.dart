import 'package:fire_chat/bloc/login_bloc.dart';
import 'package:fire_chat/item_views/ask_user_text_view.dart';
import 'package:fire_chat/item_views/button_view.dart';
import 'package:fire_chat/item_views/labeland_textfield_view.dart';
import 'package:fire_chat/pages/home_page.dart';
import 'package:fire_chat/pages/register_page.dart';
import 'package:fire_chat/resources/strings.dart';
import 'package:fire_chat/utils/show_shackbar.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LoginBloc(),
      child: Consumer<LoginBloc>(
        builder: (BuildContext context, bloc, Widget? child) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: const Text(
                    loginText,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Consumer<LoginBloc>(
                    builder: (BuildContext context, bloc, Widget? child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          LabelAndTextFieldView(emailLabelText, emailHintText,
                              (emailText) {
                            bloc.typedEmailText(emailText);
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          LabelAndTextFieldView(
                              passwordLabelText, passwordHintText,
                              (passwordText) {
                            bloc.typedPasswordText(passwordText);
                          }),
                          const SizedBox(
                            height: 32,
                          ),
                          ButtonView(loginText, () {
                            bloc.onTapLogin().whenComplete(() {
                              if (bloc.isLoginError) {
                                Future.delayed(const Duration(seconds: 1))
                                    .then((value) {
                                  ShowSnackBar.showSnackBar(context,
                                      bloc.loginErrorMessage.toString());
                                });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>const HomePage()));
                              }
                            });
                          }),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            "OR",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          AskUserTextView(dontHaveAnAccount, registerText, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => RegisterPage())));
                          })
                        ],
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: bloc.isLoading,
                child: Container(
                  color: Colors.black12,
                  child: const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: LoadingIndicator(
                          colors: [Colors.white, Colors.transparent],
                          strokeWidth: 5,
                          indicatorType: Indicator.ballRotate),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
