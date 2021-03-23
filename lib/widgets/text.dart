import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bmi_calculator/layout.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  const TextWidget({
    Key key,
    this.text,
    this.color,
    this.size,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: SizeConfig.blockHorizontal * size,
        fontWeight: weight,
      ),
    );
  }
}
