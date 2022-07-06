import 'package:flutter/material.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/setup_profile/purchase_power.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/custom_appbar.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class ResidentStatus extends StatefulWidget {
  const ResidentStatus({Key? key}) : super(key: key);

  @override
  State<ResidentStatus> createState() => _ResidentStatusState();
}

class _ResidentStatusState extends State<ResidentStatus> {
  final double percentCompleted = 0.4;
  bool isChecked = false;
  String dropDownFistItem = 'Australia';
  final List<CheckedBoxClass> _checkBoxList = [
    CheckedBoxClass(isChecked: false, title: 'Australia'),
    CheckedBoxClass(isChecked: false, title: 'Permanent Resident'),
    CheckedBoxClass(isChecked: false, title: 'Non resident'),
    CheckedBoxClass(isChecked: false, title: 'Working Holiday'),
  ];
  final List<String> _listOfCountries = [
    'Australia',
    'India',
    'Germany',
    'Japan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const CustomAppBar(text: 'Resident Status', backButton: true),
            const SizedBox(
              height: 20,
            ),
            buildLinearPercentIndicator(percent: percentCompleted),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  itemCount: _checkBoxList.length,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      elevation: 2,
                      radius: 10,
                      color: Colors.white,
                      widget: CheckboxListTile(
                          title: regularText(
                              text: _checkBoxList[index].title,
                              color: Colors.black,
                              size: 18),
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: _checkBoxList[index].isChecked,
                          onChanged: (value) {
                            setState(() {
                              _checkBoxList[index].isChecked = value!;
                            });
                          }),
                    );
                  }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: mediumText(text: 'Add Country'),
                ),
                CardWidget(
                  elevation: 2,
                  radius: 5,
                  color: Colors.white,
                  widget: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: DropdownButton(
                          value: dropDownFistItem,
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(),
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          items: _listOfCountries.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (val) {
                            dropDownFistItem = val.toString();
                            _checkBoxList[0] = CheckedBoxClass(
                                isChecked: true, title: val.toString());
                            setState(() {});
                          }),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            elevatedButton(
              context: context,
              text: 'Next',
              function: () => nextPage(
                context: context,
                widget: const PurchasePower(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckedBoxClass {
  final String title;
  late bool isChecked;

  CheckedBoxClass({required this.isChecked, required this.title});
}
