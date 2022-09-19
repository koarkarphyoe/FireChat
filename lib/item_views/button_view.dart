import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  final String buttonLabelText;

  const ButtonView(this.buttonLabelText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            buttonLabelText,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
