// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/consulta_cep.dart';

class SplashScreenDelayPage extends StatefulWidget {
  const SplashScreenDelayPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenDelayPage> createState() => _SplashScreenDelayPageState();
}

class _SplashScreenDelayPageState extends State<SplashScreenDelayPage> {

  openHome(){
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => ConsultaCepPage()));
    });
  }

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
          child: AnimatedTextKit(
            repeatForever: false,
            onFinished: () {
              openHome();
            },
        animatedTexts: [
          TypewriterAnimatedText(
            'Hello world!',
            textStyle: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 50),
        // displayFullTextOnTap: true,
        // stopPauseOnTap: true,
      )),
    )));
  }
}
