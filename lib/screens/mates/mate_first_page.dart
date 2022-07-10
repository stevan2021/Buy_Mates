import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/screens/mates/mate_second_page.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/custom_appbar.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_field_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class MateFirstPage extends StatelessWidget {
  MateFirstPage({Key? key}) : super(key: key);
  final double percentCompleted = 0.4;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomAppBar(text: 'Who is your mate', backButton: false),
                const SizedBox(
                  height: 20,
                ),
                buildLinearPercentIndicator(percent: percentCompleted),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardAndTextInput(
                        textInputType: TextInputType.name,
                        textEditingController: _firstNameController,
                        text: 'First Name',
                        hintText: 'Enter First Name'),
                    CardAndTextInput(
                        textInputType: TextInputType.name,
                        textEditingController: _lastNameController,
                        text: 'Last Name',
                        hintText: 'Enter Last Name'),
                    CardAndTextInput(
                        textInputType: TextInputType.number,
                        textEditingController: _phoneNumberController,
                        text: 'Mobile Number',
                        hintText: 'Phone'),
                    CardAndTextInput(
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _emailController,
                        text: 'Email ID',
                        hintText: 'Enter Email ID'),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: elevatedButton(
                        context: context,
                        text: 'NEXT',
                        function: () {
                          if (_phoneNumberController.text.trim().isEmpty ||
                              _firstNameController.text.trim().isEmpty ||
                              _lastNameController.text.trim().isEmpty ||
                              _emailController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Enter All the Details'),
                              ),
                            );
                            return;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MateSecondPage(
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        email: _emailController.text,
                                        phoneNumber: int.parse(
                                            _phoneNumberController.text),
                                      ))).then(
                              (value) => Navigator.pop(context));
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardAndTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String text;
  final TextInputType textInputType;

  const CardAndTextInput(
      {Key? key,
      required this.textInputType,
      required this.textEditingController,
      required this.text,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: boldText(text: text, color: kBlackColor, size: 20),
          ),
          CardWidget(
              elevation: 2,
              color: textInputType == TextInputType.number
                  ? kCardColor
                  : kWhiteColor,
              radius: 10,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget(
                    textEditingController: textEditingController,
                    hintText: hintText,
                    textInputType: textInputType),
              ))
        ],
      ),
    );
  }
}
