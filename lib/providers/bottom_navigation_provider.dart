import 'package:flutter/material.dart';

class BottomNavigationProvider with ChangeNotifier{
  int bottomIndex = 3;
  void changeIndex({required int index}){
    bottomIndex = index;
    notifyListeners();
  }

}