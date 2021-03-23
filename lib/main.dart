import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/myhomepage.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _baseTheme = ThemeData(
      canvasColor: Colors.blue,
    );
    return MaterialApp(
      theme: _baseTheme,
      home: MyHomePage(),
    );
  }
}
