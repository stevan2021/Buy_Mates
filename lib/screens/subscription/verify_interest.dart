import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/subscription/subs_pay.dart';
import 'package:buy_mate/screens/subscription/terms_and_conditions.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class VerifyInterestScreen extends StatelessWidget {
  const VerifyInterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                regularText(
                    text: 'Secure your investment',
                    color: Colors.blue,
                    size: 25,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: Image.asset('asset/book.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                boldText(
                    text: '\$500 AUD',
                    color: kBlackColor,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                regularText(
                    text:
                        'To verify your interest\nof investment we ask for deposit.',
                    color: kBlackColor,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                regularText(
                    size: 13,
                    text:
                        'After we receive the money we will start with all the paper work. No worries, in case that do not classify in BUYMATE you will get your money back.',
                    color: kBlackColor.withOpacity(0.5),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 40,
                ),
                elevatedButton(
                    context: context,
                    text: 'Continue',
                    function: () {
                      nextPage(context: context, widget: const SubsPay());
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: mediumText(text: 'Cancel', color: Colors.blue),
                ),
                const SizedBox(
                  height: 20,
                ),
                regularText(
                    text: _tAndC,
                    size: 13,
                    color: kBlackColor.withOpacity(0.5),
                    textAlign: TextAlign.center),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsAndConditions()));
                  },
                  child: regularText(
                      text: 'Privacy policy',
                      size: 13,
                      color: Colors.blue,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String _tAndC =
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ';
