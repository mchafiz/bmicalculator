import 'package:flutter/material.dart';

class Kelamin {
  final String kelamin;
  final String image;
  final Color color;

  Kelamin(this.kelamin, this.image, this.color);
}

final listkelamin = [
  Kelamin('Male', 'assets/1.png', Colors.indigo[800]),
  Kelamin('Female', 'assets/2.png', Colors.indigo[800]),
];
