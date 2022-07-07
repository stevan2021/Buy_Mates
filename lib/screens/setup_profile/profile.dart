import 'package:flutter/material.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/setup_profile/resident_status.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/custom_appbar.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final double percentCompleted = 0.2;
  final TextEditingController _fistNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(
              text: 'Setup Profile',
              backButton: false,
            ),
            const SizedBox(
              height: 20,
            ),
            buildLinearPercentIndicator(percent: percentCompleted),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                _circularAvatar(function: () {
                  /// Todo: Select image function
                }),
                NameAndCard(
                    controller: _fistNameController,
                    text: 'First Name',
                    textInputType: TextInputType.name,
                    hintText: 'Enter First Name'),
                NameAndCard(
                    controller: _lastNameController,
                    text: 'Last Name',
                    textInputType: TextInputType.name,
                    hintText: 'Enter Last Name'),
                NameAndCard(
                  controller: _phoneNumberController,
                  text: 'Mobile Number',
                  textInputType: const TextInputType.numberWithOptions(),
                  hintText: '+41-5413654789',
                  cardColor: const Color(0xFFE7E7E7),
                ),
                NameAndCard(
                    controller: _emailController,
                    text: 'Email ID',
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter Email ID'),
                const SizedBox(
                  height: 15,
                ),
                elevatedButton(
                    context: context,
                    text: 'Next',
                    function: () => nextPage(
                        context: context, widget: const ResidentStatus())),
                const SizedBox(
                  height: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _circularAvatar({required Function() function}) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black54,
          ),
          Positioned(
            bottom: 0,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200)),
              child: IconButton(
                onPressed: function,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NameAndCard extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String hintText;
  final Color? cardColor;
  final TextInputType textInputType;

  const NameAndCard(
      {Key? key,
      required this.controller,
      required this.text,
      this.cardColor,
      required this.textInputType,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: mediumText(text: text),
        ),
        CardWidget(
          color: cardColor ?? Colors.white,
          elevation: 2,
          radius: 12,
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: textInputType,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ),
          ),
        )
      ],
    );
  }
}
