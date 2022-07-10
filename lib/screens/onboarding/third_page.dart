import 'package:flutter/material.dart';
import 'package:buy_mate/screens/login/login.dart';
import 'package:buy_mate/widgets/bold_text.dart';
import 'package:buy_mate/widgets/center_image.dart';
import 'package:buy_mate/widgets/elevated_button.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const CenterImage(
                  image: 'asset/frame.png',
                ),
              ),
            ),
            const BoldText(
                text: 'BuyMates manage the property and pay your rental %'),
            const SizedBox(
              height: 20,
            ),
            elevatedButton(
                context: context,
                text: 'Get Started',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
