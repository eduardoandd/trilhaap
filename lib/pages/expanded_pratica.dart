// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PraticandoExpanded extends StatelessWidget {
  const PraticandoExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 17, 30, 58),

        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              Container(
                color: Colors.red,
                height: 60,
                width: 60,
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  height: 60,
                  width: 60,
                ),
              ),
              Container(
                color: Colors.yellow,
                height: 60,
                width: 200,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.green,
                )
              ),
              
          ]),
          
        ),




    ));
  }
}