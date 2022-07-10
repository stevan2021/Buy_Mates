import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/modals/mate_class.dart';
import 'package:buy_mate/providers/mate_provider.dart';
import 'package:buy_mate/screens/subscription/verify_interest.dart';
import 'package:buy_mate/screens/mates/mate_first_page.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/text_styles.dart';
import 'package:provider/provider.dart';

class AllocationScreen extends StatefulWidget {
  final MateClass? mate;

  const AllocationScreen({Key? key, this.mate}) : super(key: key);

  @override
  State<AllocationScreen> createState() => _AllocationScreenState();
}

int _totalMoney = 250000;
double _currentSelectedMoney = 0;
double _moneySliderValue = 0;
double _borrowSliderValue = 0;
double _totalBorrowMoney = 150000;
double _currentBorrowMoney = 0;
int _totalMoneyToAllocate = 250000;

class _AllocationScreenState extends State<AllocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalMateMoney = Provider.of<MateProvider>(context).totalMateMoney;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _topBar(context: context),
              const SizedBox(
                height: 10,
              ),
              const SliderWithMoneyWidget(),
              const SliderWithBorrowMoneyWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: regularText(
                    color: kBlackColor,
                    size: 20,
                    textAlign: TextAlign.center,
                    text:
                        'Boost Your Purchasing Power By Connecting Friends And Family To Your Account'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _roundedButtons(index: 0),
                  _roundedButtons(index: 1),
                  _roundedButtons(index: 2),
                  _roundedButtons(index: 3),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              boldText(
                  text: '\$ $totalMateMoney', color: kBlackColor, size: 35),
              const Divider(
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              regularText(text: 'Pool Mate Money', color: kBlackColor),
              const SizedBox(
                height: 20,
              ),
              regularText(
                  text: 'TOTAL TO ALLOCATE', color: kBlackColor, size: 25),
              const SizedBox(
                height: 10,
              ),
              boldText(
                  text: '\$ $_totalMoneyToAllocate',
                  color: kBlackColor,
                  size: 35),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              elevatedButton(
                  context: context,
                  text: 'SUBMIT',
                  function: () {
                    //TODO: Submit conditions need to implement
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyInterestScreen(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundedButtons({required int index}) {
    List<MateClass> listOfMates =
        Provider.of<MateProvider>(context).listOfMates;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kLightBlack,
          borderRadius: BorderRadius.circular(200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: listOfMates.length >= (index + 1)
                ? null
                : () {
                    nextPage(context: context, widget: MateFirstPage());
                  },
            icon: listOfMates.length >= (index + 1)
                ? boldText(text: listOfMates[index].firstName.split('').first)
                : const Icon(
                    Icons.add,
                    color: kWhiteColor,
                  ),
          ),
        ),
      ),
    );
  }

  Container _topBar({required BuildContext context}) {
    return Container(
      color: kWhiteColor,
      child: SafeArea(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                    color: kBlackColor, borderRadius: BorderRadius.circular(4)),
                height: 42,
                width: 42,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Center(
              child: boldText(
                  text: 'Allocation',
                  color: kBlackColor,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWithMoneyWidget extends StatefulWidget {
  const SliderWithMoneyWidget({Key? key}) : super(key: key);

  @override
  State<SliderWithMoneyWidget> createState() => _SliderWithMoneyWidgetState();
}

final TextEditingController _moneyController = TextEditingController();

class _SliderWithMoneyWidgetState extends State<SliderWithMoneyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        regularText(
            text: 'How Much Money Do You Want To Invest In The Property',
            color: kBlackColor,
            size: 25,
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            textAlign: TextAlign.center,
            controller: _moneyController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefix: boldText(
                  text: '\$', textAlign: TextAlign.end, color: kBlackColor),
            ),
            onChanged: (value) {
              _currentSelectedMoney = double.parse(value);
              if (_currentSelectedMoney > _totalMoney ||
                  _currentSelectedMoney <= 0) {
                return;
              }
              _moneySliderValue =
                  ((_currentSelectedMoney / _totalMoney) * 100).toDouble();
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 2,
          indent: 50,
          endIndent: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        regularText(text: 'Allocated Money', color: kBlackColor),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  regularText(text: '0%', color: kBlackColor),
                  regularText(text: '100%', color: kBlackColor)
                ],
              ),
              Slider(
                  max: 100,
                  min: 0,
                  activeColor: kBlackColor,
                  inactiveColor: kLightBlack.withOpacity(0.5),
                  thumbColor: kLightBlack.withOpacity(0.7),
                  value: _moneySliderValue,
                  onChanged: (value) {
                    setState(() {
                      _moneySliderValue = value.round().toDouble();
                      _currentSelectedMoney =
                          ((_totalMoney * _moneySliderValue) / 100)
                              .roundToDouble();
                      _moneyController.text = _currentSelectedMoney.toString();
                    });
                  })
            ],
          ),
        )
      ],
    );
  }
}

class SliderWithBorrowMoneyWidget extends StatefulWidget {
  const SliderWithBorrowMoneyWidget({Key? key}) : super(key: key);

  @override
  State<SliderWithBorrowMoneyWidget> createState() =>
      _SliderWithBorrowMoneyWidgetState();
}

final TextEditingController _borrowController = TextEditingController();

class _SliderWithBorrowMoneyWidgetState
    extends State<SliderWithBorrowMoneyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        regularText(
            text: 'How Much Money Do You Want To Invest In The Property',
            color: kBlackColor,
            size: 25,
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            textAlign: TextAlign.center,
            controller: _borrowController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            decoration: InputDecoration(
              prefix: boldText(
                  text: '\$', textAlign: TextAlign.end, color: kBlackColor),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              _currentBorrowMoney = double.parse(value);
              if (_currentBorrowMoney > _totalBorrowMoney ||
                  _currentBorrowMoney <= 0) {
                return;
              }
              _borrowSliderValue =
                  ((_currentBorrowMoney / _totalBorrowMoney) * 100).toDouble();
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 2,
          indent: 50,
          endIndent: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        regularText(text: 'Allocated Money', color: kBlackColor),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  regularText(text: '0%', color: kBlackColor),
                  regularText(text: '100%', color: kBlackColor)
                ],
              ),
              Slider(
                  max: 100,
                  min: 0,
                  activeColor: kBlackColor,
                  inactiveColor: kLightBlack.withOpacity(0.5),
                  thumbColor: kLightBlack.withOpacity(0.7),
                  value: _borrowSliderValue,
                  onChanged: (value) {
                    setState(() {
                      _borrowSliderValue = value.round().toDouble();
                      _currentBorrowMoney =
                          ((_totalBorrowMoney * _borrowSliderValue) / 100)
                              .roundToDouble();
                      _borrowController.text = _currentBorrowMoney.toString();
                    });
                  })
            ],
          ),
        )
      ],
    );
  }
}
