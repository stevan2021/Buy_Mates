import 'package:buy_mate/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/home/allocation_screen.dart';
import 'package:buy_mate/screens/home/description.dart';
import 'package:buy_mate/screens/home/share_screen.dart';
import 'package:buy_mate/widgets/liner_indicator.dart';
import 'package:buy_mate/widgets/text_styles.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<CardInfo> _cardInfo = List.generate(
      5,
      (index) => CardInfo(
          funded: 26 + index,
          text: '30-40% Profitability 36 Months\nPotential Rent 900/W',
          bathroom: 2,
          bed: 3,
          cost: 3250000,
          id: '1',
          likes: 28,
          location: 'Rose Bay, Sydney',
          image: [
            'asset/card_image.png',
            'asset/calculator.png',
            'asset/card_image.png',
          ],
          parking: 2));

  late CardInfo _currentCard;

  @override
  void initState() {
    _currentCard = _cardInfo[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: Stack(
            children: List.generate(
                _cardInfo.length,
                (index) => CardWithImage(
                      index: index,
                      cardInfo: _cardInfo,
                    )).reversed.toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWithTaps(
                icon: Icons.replay,
                size: 25,
                function: () {
                  /// TODO:
                },
                isBig: false),
            iconWithTaps(
                icon: Icons.close,
                size: 40,
                function: () {
                  Provider.of<BottomNavigationProvider>(context, listen: false)
                      .changeIndex(index: 3);
                },
                isBig: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: boldText(
                  text: '${_currentCard.funded}%\nFunded',
                  color: kBlackColor,
                  textAlign: TextAlign.center,
                  size: 22),
            ),
            iconWithTaps(
                icon: Icons.favorite,
                size: 40,
                function: () {
                  nextPage(context: context, widget: const AllocationScreen());
                },
                isBig: true),
            iconWithTaps(
                icon: Icons.share,
                size: 25,
                function: () {
                  nextPage(context: context, widget: const ShareScreen());
                },
                isBig: false),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        buildLinearPercentIndicator(percent: _currentCard.funded / 100)
      ],
    );
  }
}

class CardWithImage extends StatefulWidget {
  final List<CardInfo> cardInfo;
  final int index;

  const CardWithImage({Key? key, required this.index, required this.cardInfo})
      : super(key: key);

  @override
  State<CardWithImage> createState() => _CardWithImageState();
}

int _imageIndex = 0;

class _CardWithImageState extends State<CardWithImage> {
  final List<PeopleLiked> _peopleLiked = List.generate(
    15,
    (index) => PeopleLiked(
        image: 'asset/heart.png',
        name: 'Person $index',
        subtitle: 'Some subtitle',
        allocated: index % 2 == 0 ? 35 : null),
  );

  Container _smallCards({required String text, required IconData icon}) {
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Center(
            child: mediumText(
              text: text,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.index == 0
                ? 20
                : widget.index == 1
                    ? 10
                    : 0),
        child: ClipRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                widget.cardInfo[widget.index].image[_imageIndex],
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 10,
                left: 2,
                right: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _imageIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 8,
                            width: 100,
                            decoration: BoxDecoration(
                              color: _imageIndex == index
                                  ? kWhiteColor
                                  : kCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 5,
                child: IconButton(
                  onPressed: () {
                    showBottomSheetWidget(
                        context: context, peopleLiked: _peopleLiked);
                  },
                  icon: Column(
                    children: [
                      const Flexible(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 18,
                        ),
                      ),
                      regularText(
                          text: widget.cardInfo[widget.index].likes.toString(),
                          color: kBlackColor,
                          size: 12)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        boldText(
                            text:
                                '\$ ${widget.cardInfo[widget.index].cost.toString()}',
                            textAlign: TextAlign.center),
                        IconButton(
                          onPressed: () => nextPage(
                              context: context,
                              widget: const DescriptionScreen()),
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            color: kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kWhiteColor,
                          size: 15,
                        ),
                        regularText(
                            text: widget.cardInfo[widget.index].location),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _smallCards(
                            text: widget.cardInfo[widget.index].bed.toString(),
                            icon: Icons.bed_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        _smallCards(
                            text: widget.cardInfo[widget.index].bathroom
                                .toString(),
                            icon: Icons.bathtub_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        _smallCards(
                            text: widget.cardInfo[widget.index].parking
                                .toString(),
                            icon: Icons.car_crash_outlined),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                      height: 40,
                      child: Center(
                        child: regularText(
                            text: widget.cardInfo[widget.index].text,
                            size: 15,
                            textAlign: TextAlign.center),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PeopleLiked {
  final String image;
  final String name;
  final String subtitle;
  final int? allocated;

  PeopleLiked({
    required this.image,
    required this.name,
    required this.subtitle,
    this.allocated,
  });
}

class CardInfo {
  final String id;
  final int cost;
  final String location;
  final int bed;
  final int bathroom;
  final int parking;
  final String text;
  final int likes;
  final List<String> image;
  final int funded;

  CardInfo(
      {required this.text,
      required this.bathroom,
      required this.funded,
      required this.bed,
      required this.cost,
      required this.id,
      required this.likes,
      required this.location,
      required this.image,
      required this.parking});
}

Widget iconWithTaps(
    {required Function() function,
    required IconData icon,
    required bool isBig,
    required double size,
    Color? containerColor}) {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: isBig ? 58 : 50,
        width: isBig ? 58 : 50,
        decoration: BoxDecoration(
          color: containerColor ?? Colors.transparent,
          border: Border.all(
            color: kBlackColor,
          ),
          borderRadius: BorderRadius.circular(200),
        ),
        child: IconButton(
          onPressed: function,
          icon: Icon(
            icon,
            size: size,
          ),
        ),
      ),
    ),
  );
}

showBottomSheetWidget(
    {required BuildContext context, required List<PeopleLiked> peopleLiked}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  regularText(text: 'LIKED BY'),
                  regularText(text: '26 requested', size: 15),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: kWhiteColor,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                    peopleLiked.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(peopleLiked[index].image),
                      ),
                      subtitle: regularText(text: peopleLiked[index].subtitle),
                      title: regularText(text: peopleLiked[index].name),
                      trailing: Container(
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhiteColor),
                            color: peopleLiked[index].allocated == null
                                ? kBlackColor
                                : kWhiteColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: boldText(
                              textAlign: TextAlign.center,
                              text: peopleLiked[index].allocated == null
                                  ? 'Pending'
                                  : '${peopleLiked[index].allocated}% allocated',
                              size: 15,
                              color: peopleLiked[index].allocated == null
                                  ? kWhiteColor
                                  : kBlackColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
