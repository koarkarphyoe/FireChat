import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  final String buttonLabelText;
  final Function() onTapButton;
  const ButtonView(this.buttonLabelText, this.onTapButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          onTapButton();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              buttonLabelText,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
