import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final Color? color;
  final String text;

  const BoldText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color ?? Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
    );
  }
}
