import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/subscription/pay_success.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class SubsPay extends StatefulWidget {
  const SubsPay({Key? key}) : super(key: key);

  @override
  State<SubsPay> createState() => _SubsPayState();
}

String _selectedPaymentMethod = '';

class _SubsPayState extends State<SubsPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              boldText(text: 'Payment', color: kBlackColor),
              const SizedBox(
                height: 40,
              ),
              CardWidget(
                radius: 10,
                elevation: 2,
                color: kWhiteColor,
                widget: ListTile(
                  leading: Radio<String>(
                    value: 'visa',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedPaymentMethod = value!;
                        },
                      );
                    },
                  ),
                  title: regularText(text: 'Credit Card', color: kBlackColor),
                  trailing: Image.asset(
                    'asset/visa.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CardWidget(
                radius: 10,
                elevation: 2,
                color: kWhiteColor,
                widget: ListTile(
                  leading: Radio<String>(
                    value: 'paypal',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedPaymentMethod = value!;
                        },
                      );
                    },
                  ),
                  title: regularText(text: 'PayPal', color: kBlackColor),
                  trailing: Image.asset(
                    'asset/paypal.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CardWidget(
                radius: 10,
                elevation: 2,
                color: kWhiteColor,
                widget: ListTile(
                  leading: Radio<String>(
                    value: 'apple',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedPaymentMethod = value!;
                        },
                      );
                    },
                  ),
                  title: regularText(text: 'Apple Pay', color: kBlackColor),
                  trailing: Image.asset(
                    'asset/apple.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              elevatedButton(
                  context: context,
                  text: 'Pay Now',
                  function: () {
                    if (_selectedPaymentMethod.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please select a payment method')));
                      return ;
                    }
                    nextPage(
                        context: context, widget: const PaymentSuccessScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
