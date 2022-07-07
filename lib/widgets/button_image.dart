
import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ('asset/button.png'),
    );
  }
}