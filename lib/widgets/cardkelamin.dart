import 'package:bmi_calculator/layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardKelamin extends StatelessWidget {
  final String kelamin;
  final String image;
  final Color color;
  final int index, selectedindex;
  const CardKelamin(
      {Key key,
      this.kelamin,
      this.image,
      this.color,
      this.index,
      this.selectedindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockHorizontal * 45,
      height: SizeConfig.blockVertical * 22,
      child: Card(
        shape: (selectedindex == index)
            ? RoundedRectangleBorder(side: BorderSide(color: Colors.white))
            : null,
        color: color,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockVertical * 1,
            ),
            width: SizeConfig.blockHorizontal * 40,
            height: SizeConfig.blockVertical * 15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(image))),
          ),
          Text(
            kelamin,
            style: GoogleFonts.lato(
                color: (selectedindex == index) ? Colors.white : Colors.grey,
                fontSize: SizeConfig.blockHorizontal * 5,
                fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
