import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/setup_profile/purchase_power.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class PurchasePowerScreen extends StatelessWidget {
  const PurchasePowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
              ),
              title: boldText(text: 'Top #293 Mates', size: 22),
              subtitle: regularText(
                  text: 'Below are your latest updates.',
                  color: kWhiteColor.withOpacity(0.7)),
            ),
            _upperTwoWidget(context),
            const SizedBox(
              height: 20,
            ),
            _middleTwoWidgets(context),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  nextPage(context: context, widget: const PurchasePower());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kLightBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          boldText(text: 'Purchasing\nCalculator', size: 25),
                          Image.asset('asset/calculator.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _middleTwoWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.47,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                regularText(
                    text: 'Value of your assets'.toUpperCase(),
                    size: 12,
                    color: kBlackColor),
                const SizedBox(
                  height: 10,
                ),
                boldText(text: '\$ 250,281', size: 22, color: kBlackColor),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                regularText(
                    text: 'Rental Earning', size: 15, color: kBlackColor),
                const SizedBox(
                  height: 10,
                ),
                boldText(text: '\$ 80 /W', color: Colors.green),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: kLightBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                boldText(text: 'Five-year forecast', size: 16),
                const SizedBox(
                  height: 10,
                ),
                regularText(text: 'Potential Borrowing'),
                const SizedBox(
                  height: 10,
                ),
                boldText(text: '\$ 353,000', size: 22),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                regularText(text: 'Potential rental Profit'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: boldText(
                        text: '\$ 20,800', size: 20, color: Colors.green),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _upperTwoWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.47,
          decoration: BoxDecoration(
            color: kLightBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                regularText(text: 'Total Purchasing power'),
                const SizedBox(
                  height: 10,
                ),
                boldText(text: '\$ 2,528,100', size: 22),
                const SizedBox(
                  height: 10,
                ),
                regularText(text: 'Your Purchasing power'),
                const SizedBox(
                  height: 10,
                ),
                boldText(text: '\$ 250,100', size: 22),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhiteColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: boldText(text: 'Verified', color: Colors.green),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: kLightBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    boldText(text: 'New Alert', size: 18, color: Colors.green),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.notifications,
                      size: 25,
                      color: Colors.green,
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(200),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              boldText(
                                  text: 'Verify your Power',
                                  size: 12,
                                  color: kWhiteColor),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: regularText(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              color: kWhiteColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
