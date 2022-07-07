import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kLightBlack, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child:
                    boldText(textAlign: TextAlign.center, text: 'Scan QR Code'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardWidget(
              color: kWhiteColor,
              widget: Image.asset('asset/qrcode.png'),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kLightBlack, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: boldText(textAlign: TextAlign.center, text: 'Apps'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardWidget(
              color: kWhiteColor,
              widget: Padding(
                padding: const EdgeInsets.all(15),
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
          ],
        ),
      ),
    );
  }
}
