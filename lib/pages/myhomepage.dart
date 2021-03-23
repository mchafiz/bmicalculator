import 'dart:ui';

import 'package:bmi_calculator/layout.dart';
import 'package:bmi_calculator/model/kelaminmodel.dart';
import 'package:bmi_calculator/pages/resultpage.dart';
import 'package:bmi_calculator/providers/bmiprovider.dart';
import 'package:bmi_calculator/providers/calculateprovider.dart';
import 'package:bmi_calculator/providers/incrementprovider.dart';
import 'package:bmi_calculator/widgets/cardkelamin.dart';
import 'package:bmi_calculator/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentstate = 0.0;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
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
                    text: 'BMI CALCULATOR',
                    color: Colors.white,
                    size: 5,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 600,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listkelamin.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => setState(() => selectedIndex = index),
                            child: CardKelamin(
                              index: index,
                              selectedindex: selectedIndex,
                              color: listkelamin[index].color,
                              image: listkelamin[index].image,
                              kelamin: listkelamin[index].kelamin,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.blockHorizontal * 87,
              height: SizeConfig.blockVertical * 25,
              color: Colors.indigo[900],
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockVertical * 4,
                  ),
                  TextWidget(
                    text: 'HEIGHT',
                    color: Colors.white,
                    size: 5,
                    weight: FontWeight.w600,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: _currentstate.round().toString(),
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: SizeConfig.blockHorizontal * 18,
                            fontWeight: FontWeight.w900)),
                    TextSpan(
                        text: 'cm',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: SizeConfig.blockHorizontal * 5,
                            fontWeight: FontWeight.w400))
                  ])),
                  Slider(
                    value: _currentstate,
                    min: 0,
                    max: 300,
                    label: _currentstate.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentstate = value;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              width: SizeConfig.blockHorizontal * 50,
              height: SizeConfig.blockVertical * 26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.blockHorizontal * 45,
                    height: SizeConfig.blockVertical * 26,
                    child: Card(
                      color: Colors.indigo[900],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockVertical * 1.5,
                            ),
                            TextWidget(
                              color: Colors.white,
                              size: 5,
                              text: 'WEIGHT',
                              weight: FontWeight.bold,
                            ),
                            Consumer(
                              builder: (context, watch, child) {
                                final hasil = watch(incrementProvider);
                                return TextWidget(
                                  color: Colors.white,
                                  size: 17,
                                  text: hasil.counter.toString(),
                                  weight: FontWeight.w900,
                                );
                              },
                            ),
                            Consumer(
                              builder: (context, watch, child) {
                                final hasil = watch(incrementProvider);
                                return Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: () {
                                          if (hasil.counter <= 0) {
                                          } else {
                                            context
                                                .read(incrementProvider)
                                                .decrement();
                                          }
                                        },
                                        onLongPress: () {
                                          context
                                              .read(incrementProvider)
                                              .decrementten();
                                        },
                                        child: SizedBox(
                                          width:
                                              SizeConfig.blockHorizontal * 20,
                                          height: SizeConfig.blockVertical * 20,
                                          child: Container(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.indigo[700],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: () {
                                          context
                                              .read(incrementProvider)
                                              .increment();
                                        },
                                        onLongPress: () {
                                          context
                                              .read(incrementProvider)
                                              .incrementten();
                                        },
                                        child: SizedBox(
                                          width:
                                              SizeConfig.blockHorizontal * 20,
                                          height: SizeConfig.blockVertical * 20,
                                          child: Container(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.indigo[700],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.blockVertical * 1.4,
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockVertical * 200,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Consumer(
        builder: (context, watch, child) {
          final hasil = watch(incrementProvider);
          final hasil1 = watch(calculateprovider);
          return InkWell(
            focusColor: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            onTap: () {
              if (selectedIndex == -1 ||
                  _currentstate == 0 ||
                  hasil.counter == 0) {
                final snackBar = SnackBar(
                  content: Text(
                      'Pastikan anda sudah memilih jenis kelamin dan mengisi tinggi serta berat badan'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                context.read(calculateprovider).calculateBMI(
                    _currentstate.round().toDouble(), hasil.counter.toDouble());
                context.read(bmiprovider).changewarna(hasil1.result);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            result: hasil1.result, kelamin: selectedIndex)));
              }
            },
            child: SizedBox(
                width: double.infinity,
                height: SizeConfig.blockVertical * 12,
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CALCULATE',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: SizeConfig.blockHorizontal * 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                )),
          );
        },
      ),
    );
  }
}
