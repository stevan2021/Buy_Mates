import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Image.asset(
        ('asset/button.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
