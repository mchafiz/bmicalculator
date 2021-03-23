import 'package:flutter/cupertino.dart';

class WarnaText extends ChangeNotifier {
  int bmiresult;

  void changewarna(double result) {
    var hasil = result.round() / 100;
    print(hasil);
    if (hasil < 0.185) {
      bmiresult = 1;
      notifyListeners();
    } else if (hasil >= 0.185 && hasil <= 0.249) {
      bmiresult = 2;
      notifyListeners();
    } else if (hasil >= 0.25 && hasil <= 0.299) {
      bmiresult = 3;
      notifyListeners();
    } else if (hasil > 0.30) {
      bmiresult = 4;
      notifyListeners();
    } else {
      bmiresult = 0;
      notifyListeners();
    }
    print(bmiresult);
  }
}
