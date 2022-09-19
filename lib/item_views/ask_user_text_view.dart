import 'package:flutter/material.dart';

class AskUserTextView extends StatelessWidget {
  final String askUserText;
  final String userActionText;
  final Function() onTapUserActionText;

  const AskUserTextView(
      this.askUserText, this.userActionText, this.onTapUserActionText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(askUserText,
            style: const TextStyle(color: Colors.black, fontSize: 14)),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            onTapUserActionText();
          },
          child: Text(
            userActionText,
            style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
