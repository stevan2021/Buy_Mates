import 'package:flutter/material.dart';
import 'package:buy_mate/screens/onboarding/first_page.dart';
import 'package:buy_mate/widgets/bold_text.dart';
import 'package:buy_mate/widgets/center_image.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future getFuture;

  Future<void> initial() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    getFuture = initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CenterImage(image: 'asset/logo.png'),
                      SizedBox(
                        height: 20,
                      ),
                      BoldText(
                        text: 'Property Sharing solutions',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 75,
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CenterImage(image: 'asset/background.png'),
                ),
              ],
            ),
          );
        }
        return const FirstPage();
      },
    );
  }
}
