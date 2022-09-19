import 'package:flutter/material.dart';

class LabelAndTextFieldView extends StatelessWidget {
  final String labelText;
  final String hintText;
  const LabelAndTextFieldView(this.labelText, this.hintText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
              decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ))
        ],
      ),
    );
  }
}
