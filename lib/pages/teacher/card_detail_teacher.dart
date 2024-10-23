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

                Center(
                  child: Container(
                    child:
                    Text(cardDetailTeacher.word, style:TextStyle(fontSize: 30, fontWeight: FontWeight.w700))
                  ),
                ),

                SizedBox(height: 15,),
                
                Center(
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.grey,

                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            margin:EdgeInsets.only(bottom:7),
                            child:
                            Text(
                              cardDetailTeacher.imagem,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ),
                          
                          Divider(
                            color: Colors.grey, // Cor da linha
                            thickness: 2,       // Espessura da linha
                            indent: 20,         // Espaço antes da linha
                            endIndent: 20,      // Espaço depois da linha
                          ),

                          Container(
                            child:
                              Image.asset(
                                "assets/bottle.png",
                              ),
                          ),
                        ],
                      ),
                    ),
                    
                  ),
                ),
               
              ],
            ),
          ),
        )
      ),
    );
  }
}