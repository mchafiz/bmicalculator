import 'package:flutter/cupertino.dart';

class CalculateNotifier extends ChangeNotifier {
  double result = 0.0;

  void calculateBMI(double getheight, double getweight) {
    double height = getheight / 100;
    double weight = getweight;

    double heightSquare = height * height;
    result = weight / heightSquare;
    notifyListeners();
  }
}
