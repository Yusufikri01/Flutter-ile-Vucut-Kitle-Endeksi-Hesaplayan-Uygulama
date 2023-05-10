import 'package:flutter/material.dart';

class ElevatedButtonPro extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;

  ElevatedButtonPro(this.onPressed, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shadowColor: Colors.purple,
            elevation: 20,
            shape: StadiumBorder(),
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
