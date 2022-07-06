import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/modals/mate_class.dart';
import 'package:buy_mate/providers/mate_provider.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/custom_appbar.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_styles.dart';
import 'package:provider/provider.dart';

class MateSecondPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;

  MateSecondPage(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber})
      : super(key: key);
  final double percentCompleted = 0.8;
  final TextEditingController _moneyLendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const CustomAppBar(text: 'Amount', backButton: true),
          const SizedBox(
            height: 20,
          ),
          buildLinearPercentIndicator(percent: percentCompleted),
          const SizedBox(
            height: 50,
          ),
          boldText(
              text: 'How much will your mate lend you',
              color: kBlackColor,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 50,
          ),
          CardWidget(
            elevation: 2,
            radius: 10,
            color: kWhiteColor,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  children: [
                    boldText(text: '\$', color: kBlackColor, size: 20),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _moneyLendController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          elevatedButton(
            context: context,
            text: 'SUBMIT',
            function: () {
              Provider.of<MateProvider>(context, listen: false).addItem(
                  mateClass: MateClass(
                email: email,
                firstName: firstName,
                lastName: lastName,
                mobileNumber: phoneNumber,
                moneyLend: int.parse(_moneyLendController.text),
              ));
              Provider.of<MateProvider>(context, listen: false)
                  .calculateTotalMateMoney();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
