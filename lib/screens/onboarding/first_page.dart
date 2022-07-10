import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/login/login.dart';
import 'package:buy_mate/screens/onboarding/second_page.dart';
import 'package:buy_mate/widgets/bold_text.dart';
import 'package:buy_mate/widgets/button_image.dart';
import 'package:buy_mate/widgets/center_image.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const CenterImage(
                image: 'asset/home.png',
              ),
            ),
            Column(
              children: [
                const BoldText(
                    text: 'Get your property that you want with mates'),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  child: const ButtonImage(),
                ),
                TextButton(
                  onPressed: () {
                    nextPage(context: context, widget: Login());
                  },
                  child: regularText(text: 'Skip', color: kBlackColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
