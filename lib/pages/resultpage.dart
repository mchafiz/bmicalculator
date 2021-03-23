import 'package:bmi_calculator/providers/bmiprovider.dart';
import 'package:bmi_calculator/providers/calculateprovider.dart';
import 'package:bmi_calculator/widgets/progressbar.dart';
import 'package:bmi_calculator/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout.dart';

class Result extends ConsumerWidget {
  final double result;
  final int kelamin;
  const Result({Key key, this.result, this.kelamin}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bmiresult = watch(bmiprovider);
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.blockVertical * 10),
          child: AppBar(
            backgroundColor: Colors.indigo[900],
            flexibleSpace: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 35),
                  child: TextWidget(
                    text: 'YOUR RESULT BMI',
                    color: Colors.white,
                    size: 5,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          )),
      body: Center(
          child: SizedBox(
              height: SizeConfig.blockVertical * 80,
              width: SizeConfig.blockHorizontal * 90,
              child: Card(
                color: Colors.indigo[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: (kelamin == 0)
                          ? 'Hello Sir, your BMI result is..'
                          : 'Hello Madam, your BMI result is..',
                      color: Colors.white,
                      size: 5,
                      weight: FontWeight.w900,
                    ),
                    TextWidget(
                      size: 10,
                      text: (bmiresult.bmiresult == 1)
                          ? 'UNDERWEIGHT'
                          : (bmiresult.bmiresult == 2)
                              ? 'NORMAL'
                              : (bmiresult.bmiresult == 3)
                                  ? 'OVERWEIGHT'
                                  : 'OBESITAS',
                      color: (bmiresult.bmiresult == 1)
                          ? Colors.red[600]
                          : (bmiresult.bmiresult == 2)
                              ? Colors.green
                              : (bmiresult.bmiresult == 3)
                                  ? Colors.amber
                                  : Colors.red[900],
                      weight: FontWeight.w900,
                    ),
                    CustomProgressBar(
                      result: result,
                    ),
                  ],
                ),
              ))),
    );
  }
}
