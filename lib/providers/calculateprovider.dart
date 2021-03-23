import 'package:bmi_calculator/notifier/calculatenotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculateprovider =
    ChangeNotifierProvider<CalculateNotifier>((ref) => CalculateNotifier());
