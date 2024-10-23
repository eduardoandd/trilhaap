// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/teacher/anous_teacher_page.dart';
import 'package:trilhaap/pages/teacher/random_word._teacher_page.dart';
import 'package:trilhaap/pages/teacher/verbs_teacher_page.dart';
import 'package:trilhaap/shared/widgets/teacher/custom_drawer_teacher.dart';

class MainPageTeacher extends StatefulWidget {
  const MainPageTeacher({Key? key}) : super(key: key);

  @override
  State<MainPageTeacher> createState() => _MainPageTeacherState();
}

class _MainPageTeacherState extends State<MainPageTeacher> {
  int pagePosition = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Random Word")),
          drawer: CustonDrawerTeacher(),

          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,

                  onPageChanged: (value) {
                    setState(() {
                      pagePosition=value;
                    });
                  },

                  children: [
                    // Container(
                    //   child:VerbsTeacherPage(texto: 'Verbs',) ,
                    // ),
                    Container(
                      child: AnounsTeacherPage(texto: "Bottle"),
                    ),
                    Container(
                      child: RandomWordTeacherPage(texto: "Random word"),
                    ),
                  ],
                ),
              ),

              BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },

                currentIndex: pagePosition,
                items: [
                  // BottomNavigationBarItem(label: "Words", icon: Icon(Icons.accessibility_new_sharp)),
                  BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
              ])
            ],
          ),
      )
    );
  }
}