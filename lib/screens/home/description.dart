import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/screens/home/activity_screen.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.54,
                width: MediaQuery.of(context).size.width,
                child: ClipRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'asset/card_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    boldText(text: '\$ 3,250,000', color: kBlackColor),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        regularText(
                            text: 'Rose bay, Sydney', color: kBlackColor),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    boldText(text: 'Description', color: kBlackColor),
                    const SizedBox(
                      height: 15,
                    ),
                    regularText(
                        text: _descriptionText,
                        color: kBlackColor.withOpacity(0.7)),
                    const SizedBox(
                      height: 20,
                    ),
                    boldText(text: 'Exit Strategy', color: kBlackColor),
                    const SizedBox(
                      height: 15,
                    ),
                    regularText(
                      text: _descriptionText,
                      color: kBlackColor.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 370,
            right: 15,
            left: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconWithTaps(
                    containerColor: kWhiteColor,
                    icon: Icons.replay,
                    size: 25,
                    function: () {},
                    isBig: false),
                iconWithTaps(
                    containerColor: kWhiteColor,
                    icon: Icons.close,
                    size: 40,
                    function: () {},
                    isBig: true),
                const SizedBox(
                  width: 30,
                ),
                iconWithTaps(
                    containerColor: kWhiteColor,
                    icon: Icons.favorite,
                    size: 40,
                    function: () {},
                    isBig: true),
                iconWithTaps(
                    containerColor: kWhiteColor,
                    icon: Icons.share,
                    size: 25,
                    function: () {},
                    isBig: false),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

const String _descriptionText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
