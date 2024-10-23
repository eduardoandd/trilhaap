// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/teacher/card_detail_teacher.dart';

class CardDetailTeacher extends StatelessWidget {
  final CardDetailTeacherModel cardDetailTeacher;

  const CardDetailTeacher({Key? key, required this.cardDetailTeacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetailTeacher.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.close)
                ),
                Container(
                  child:
                  Text(cardDetailTeacher.imagem)
                ),
                Container(
                  child:
                  Text(cardDetailTeacher.word)
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}