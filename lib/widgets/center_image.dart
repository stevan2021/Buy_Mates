import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {
  final String image;

  const CenterImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        (image),
      ),
    );
  }
}