import 'package:bmi_calculator/notifier/warnatextnotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bmiprovider = ChangeNotifierProvider<WarnaText>((ref) => WarnaText());
