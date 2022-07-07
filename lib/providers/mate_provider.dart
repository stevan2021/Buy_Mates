import 'package:flutter/material.dart';
import 'package:buy_mate/modals/mate_class.dart';

class MateProvider with ChangeNotifier {
  List<MateClass> listOfMates = [];
  int totalMateMoney = 0;

  void addItem({required MateClass mateClass}) {
    listOfMates.add(mateClass);
    notifyListeners();
  }

  void calculateTotalMateMoney() {
    for (var fund in listOfMates) {
      totalMateMoney += fund.moneyLend;
    }
  }
}
