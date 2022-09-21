import 'package:fire_chat/bloc/register_bloc.dart';
import 'package:fire_chat/item_views/ask_user_text_view.dart';
import 'package:fire_chat/utils/show_shackbar.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../item_views/button_view.dart';
import '../item_views/labeland_textfield_view.dart';
import '../resources/strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: RegisterBloc(),
      child: Consumer<RegisterBloc>(
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
                    registerText,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Consumer<RegisterBloc>(
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
                          LabelAndTextFieldView(userNameLabelText, nameHintText,
                              (userNameText) {
                            bloc.typedUserNameText(userNameText);
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
                          ButtonView(registerText, () {
                            bloc.onTapRegister().then((value) {
                              Navigator.pop(context);
                            }).catchError((error) {
                              bloc.hideLoading();
                              ShowSnackBar.showSnackBar(
                                  context, error.toString());
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
                          AskUserTextView(alreadyHaveAnAccount, loginText, () {
                            Navigator.pop(context);
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
              )
            ],
          );
        },
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarWithErrorTextView(BuildContext context, String text) {
    var snackBar = SnackBar(
      content: Text(text.toString()),
      backgroundColor: (Colors.black),
      action: SnackBarAction(
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
