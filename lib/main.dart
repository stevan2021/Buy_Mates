import 'package:flutter/material.dart';
import 'package:buy_mate/providers/mate_provider.dart';
import 'package:buy_mate/screens/loading_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MateProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
          ),
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}
