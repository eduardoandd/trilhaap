// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        // ignore: prefer_const_literals_to_create_immutables
        colors: [
          Colors.green,
          Color.fromARGB(255, 84, 66, 150),
          Colors.red,
          Color.fromARGB(255, 14, 187, 129)
        ],
        // stops: []
      )),
      child: Center(
        child:AnimatedTextKit(
          repeatForever:true,
          animatedTexts: [
            FadeAnimatedText(
              'Fade First',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            ScaleAnimatedText(
              'Then Scale',
              textStyle: TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
            ),
          ],
        ),
      ),
    )));
  }
}
