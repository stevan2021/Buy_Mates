import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/login/login.dart';
import 'package:buy_mate/screens/onboarding/third_page.dart';
import 'package:buy_mate/widgets/bold_text.dart';
import 'package:buy_mate/widgets/button_image.dart';
import 'package:buy_mate/widgets/center_image.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: CenterImage(
                        image: 'asset/man.png',
                      ),
                    ),
                    Flexible(
                      child: CenterImage(
                        image: 'asset/man2.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const BoldText(
              text:
                  'Boost your purchasing power by connecting friends and family to your account',
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()));
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
      ),
    );
  }
}
