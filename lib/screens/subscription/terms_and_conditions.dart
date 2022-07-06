import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/widgets/text_styles.dart';

const double _boldTextSize = 23;

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  mediumText(
                      size: 25, text: 'Privacy Policy', color: kBlackColor),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: '1. Types of Data We Collect',
                        color: kBlackColor,
                        size: _boldTextSize),
                    const SizedBox(
                      height: 20,
                    ),
                    regularText(
                      text: _dummyPrivacyText,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    boldText(
                        text: '2. Use of Your Personal Data',
                        color: kBlackColor,
                        size: _boldTextSize),
                    const SizedBox(
                      height: 20,
                    ),
                    regularText(
                      text: _dummyPrivacyText,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    boldText(
                        text: '3. Disclosure of your Personal Data',
                        color: kBlackColor,
                        size: _boldTextSize),
                    const SizedBox(
                      height: 20,
                    ),
                    regularText(
                      text: _dummyPrivacyText,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const String _dummyPrivacyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
