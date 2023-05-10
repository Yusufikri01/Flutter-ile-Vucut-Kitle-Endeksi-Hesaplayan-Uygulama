import 'package:flutter/material.dart';

class TextProporties extends StatelessWidget {
  late String text;

  TextProporties(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
