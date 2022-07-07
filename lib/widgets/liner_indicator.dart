import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

LinearPercentIndicator buildLinearPercentIndicator({required double percent}) {
  return LinearPercentIndicator(
    progressColor: const Color(0xFF37BC09),
    lineHeight: 12,
    backgroundColor: const Color(0xFFE7E7E7),
    barRadius: const Radius.circular(20),
    percent: percent,
  );
}
