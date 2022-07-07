import 'package:flutter/material.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool backButton;

  const CustomAppBar({Key? key, required this.text, required this.backButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.black,
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (backButton)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(
              width: 10,
            ),
            if (!backButton)
              Expanded(
                child: Center(
                  child: boldText(text: text),
                ),
              ),
            if (backButton)
              Expanded(
                child: boldText(
                  text: text,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
