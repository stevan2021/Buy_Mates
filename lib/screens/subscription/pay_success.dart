import 'package:buy_mate/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/screens/home/home_screen.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/text_styles.dart';
import 'package:provider/provider.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 280,
                  child: Image.asset(
                    'asset/payment_success.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                boldText(
                    color: kBlackColor,
                    size: 20,
                    textAlign: TextAlign.center,
                    text: 'Congratulations! We received your Deposit.'),
                const SizedBox(
                  height: 20,
                ),
                regularText(
                    textAlign: TextAlign.center,
                    color: kBlackColor.withOpacity(0.5),
                    text:
                        'Hold on tight! The process has just begun. A request for documentation will be sent to you shortly to your email.'),
                const SizedBox(
                  height: 20,
                ),
                elevatedButton(
                    context: context,
                    text: 'Back to Home',
                    function: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .changeIndex(index: 3);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
