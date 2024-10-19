// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/teacher/anous_teacher_page.dart';
import 'package:trilhaap/pages/teacher/random_word._teacher_page.dart';
import 'package:trilhaap/pages/teacher/verbs_teacher_page.dart';

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
          drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),

              child: Column(
                children: [
                  InkWell(
                    onTap:() {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Books", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),

                  const SizedBox(height: 10,),

                  InkWell(
                    onTap:() {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Anouns", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),

                  const SizedBox(height: 10,),

                  InkWell(
                    onTap:() {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const 
                      VerbsTeacherPage(texto: "Verbs")));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Verbs.", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),
                ]),
            ),
          ),

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
                      child: AnounsTeacherPage(texto: "Anouns"),
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