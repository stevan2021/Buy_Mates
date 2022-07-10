import 'package:flutter/material.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/setup_profile/success.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/custom_appbar.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_field_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

final TextEditingController _textEditingController = TextEditingController();

class _ExpensesState extends State<Expenses> {
  final double percentCompleted = 0.8;
  final List<String> _dropDownList = ['Per week', 'Per month', 'Per year'];
  String selectedDropDown = 'Per week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(text: 'Expenses', backButton: true),
              const SizedBox(
                height: 20,
              ),
              buildLinearPercentIndicator(percent: percentCompleted),
              const SizedBox(
                height: 40,
              ),
              CardWidget(
                radius: 5,
                widget: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        boldText(text: 'Expenses', color: Colors.black),
                        const SizedBox(
                          height: 15,
                        ),
                        extraBoldText(
                            text: 'Bills & living expenses',
                            color: Colors.black,
                            size: 15),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Container(
                                color: Colors.white,
                                width: 150,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: TextFieldWidget(
                                      textEditingController:
                                          _textEditingController,
                                      hintText: '',
                                      textInputType: TextInputType.number),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CardWidget(
                                color: Colors.white,
                                radius: 5,
                                widget: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                      underline: Container(),
                                      isExpanded: true,
                                      elevation: 0,
                                      value: selectedDropDown,
                                      hint: const Text('Per year'),
                                      items: _dropDownList.map((value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Text(value.toString()));
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedDropDown = value.toString();
                                        });
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                        regularText(
                            text:
                                'E.g. food,electricity,education,entertainment',
                            color: Colors.black.withOpacity(0.5),
                            size: 12),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: elevatedButton(
                    context: context,
                    text: 'NEXT',
                    function: () => nextPage(
                        context: context, widget: const SuccessScreen())),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
