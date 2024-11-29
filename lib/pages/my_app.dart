// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaap/pages/home_page.dart';
import 'package:trilhaap/pages/splash_screen/splash_screen_delay_page%20.dart';
import 'package:trilhaap/pages/splash_screen/splash_screen_page.dart';

import 'expanded_pratica.dart';
import 'main_page.dart' as home;
import 'teacher/login_page_teacher.dart' as teacher;
import 'login_page.dart' as login;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: HomePage(),
    );
  }
}