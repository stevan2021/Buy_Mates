import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/home/description.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class AssetScreen extends StatelessWidget {
  AssetScreen({Key? key}) : super(key: key);

  final List<AssetCardClass> _listOfAsset = [
    AssetCardClass(
        text: '3 bedroom apartment',
        id: '1',
        location: 'Bondi, 9 Miller st',
        percent: 66)
  ];

  @override
  Widget build(BuildContext context) {
    return _listOfAsset.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/sad_emoji.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              boldText(
                  text: 'No Asset Found!',
                  color: kBlackColor,
                  textAlign: TextAlign.center),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                boldText(
                    text: 'ASSETS',
                    color: kBlackColor,
                    size: 20,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 10,
                      sections: [
                        PieChartSectionData(
                            showTitle: true,
                            title: '37%',
                            value: 37,
                            color: kLightBlack,
                            radius: 60),
                        PieChartSectionData(
                            showTitle: true,
                            title: '33%',
                            value: 33,
                            color: Colors.grey,
                            radius: 60),
                        PieChartSectionData(
                            showTitle: true,
                            title: '30%',
                            value: 30,
                            color: kCardColor,
                            radius: 60),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      boldText(text: 'Details', color: kBlackColor, size: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                  _listOfAsset.length,
                  (index) => CardWidget(
                    elevation: 2,
                    color: kWhiteColor,
                    radius: 10,
                    widget: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Row(
                          children: [
                            boldText(
                                color: kBlackColor,
                                size: 15,
                                text: _listOfAsset[index].location),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                nextPage(
                                    context: context,
                                    widget: const DescriptionScreen());
                              },
                              icon: const Icon(
                                Icons.info,
                                color: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(_listOfAsset[index].text),
                        trailing: SizedBox(
                          width: 43,
                          height: 43,
                          child: Stack(
                            children: [
                              CircularProgressIndicator(
                                color: Colors.red,
                                backgroundColor: kCardColor,
                                value: _listOfAsset[index].percent / 100,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: regularText(
                                    size: 10,
                                    text: "${_listOfAsset[index].percent}%",
                                    color: kBlackColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class AssetCardClass {
  final String location;
  final String text;
  final int percent;
  final String id;

  AssetCardClass(
      {required this.text,
      required this.id,
      required this.location,
      required this.percent});
}
