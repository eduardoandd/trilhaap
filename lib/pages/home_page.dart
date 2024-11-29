// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trilhaap/pages/brasil_fields_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: PageView(controller: pageController, children: [
              Container(
                color: Colors.white,
                child: BrasilFieldsPage()
              ),
              Container(
                color: Color.fromARGB(255, 25, 23, 170),
                child: ButtonBar(
                  
                ),
              ),
              Container(
                color: Color.fromARGB(255, 11, 235, 59),
              ),
            ]),
            
            ));
  }
}
