import 'package:bmi_calculator/providers/bmiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout.dart';

class CustomProgressBar extends StatelessWidget {
  final double result;
  const CustomProgressBar({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = 200;
    double totalvalue = 100;
    double ratio = result / totalvalue;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: SizeConfig.blockVertical * 4,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(15),
                    child: AnimatedContainer(
                      width: width * ratio,
                      height: SizeConfig.blockVertical * 4,
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: (ratio < 0.185)
                            ? Colors.red[600]
                            : (ratio >= 0.185 && ratio <= 0.249)
                                ? Colors.green
                                : (ratio >= 0.25 && ratio <= 0.299)
                                    ? Colors.amber
                                    : (ratio >= 0.30)
                                        ? Colors.red[900]
                                        : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockVertical * 2,
          ),
        ],
      ),
    );
  }
}
