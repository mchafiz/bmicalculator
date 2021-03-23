import 'package:flutter/cupertino.dart';

class NotifIncrement extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void incrementten() {
    counter += 10;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void decrementten() {
    counter -= 10;
    notifyListeners();
  }
}
