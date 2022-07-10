import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: kBlackColor,
        title: boldText(text: 'Share it'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kWhiteColor,
            )),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: kLightBlack, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child:
                    boldText(textAlign: TextAlign.center, text: 'Scan QR Code'),
              ),
            ),
            CardWidget(
              color: kWhiteColor,
              widget: Padding(
                padding: const EdgeInsets.all(2),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  child: Image.asset(
                    'asset/qrcode.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: kLightBlack,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: boldText(textAlign: TextAlign.center, text: 'Apps'),
              ),
            ),
            CardWidget(
              color: kWhiteColor,
              widget: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                              ),
                            )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
