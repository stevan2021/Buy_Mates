import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget widget;
  final double? elevation;
  final double? radius;
  final Color? color;

  const CardWidget(
      {Key? key, required this.widget, this.elevation, this.radius, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: elevation ?? 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        color: color ?? const Color(0xFFE7E7E7),
        child: widget,
      ),
    );
  }
}
