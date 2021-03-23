import 'package:bmi_calculator/notifier/incrementnotif.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final incrementProvider =
    ChangeNotifierProvider<NotifIncrement>((ref) => NotifIncrement());
