// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndicatorPage extends StatefulWidget {
  const IndicatorPage({Key? key}) : super(key: key);

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 3.0,
              percent: 0.5,
              center: Text("100%"),
              progressBorderColor: Color.fromARGB(255, 206, 203, 11),
            ),
            CircularPercentIndicator(
              radius: 130.0,
              animation: true,
              animationDuration: 4000,
              lineWidth: 15.0,
              percent: 0.7,
              center: Text(
                "40 hours",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.yellow,
              progressColor: Color.fromARGB(255, 54, 57, 244),
            ),
            
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            )
          ],
        )),
      ),
    );
  }
}
