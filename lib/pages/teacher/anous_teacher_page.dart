// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/teacher/card_detail_teacher.dart' as card_detail;

import '../../model/teacher/card_detail_teacher.dart';

class AnounsTeacherPage extends StatefulWidget {
  final String texto;
  const AnounsTeacherPage({Key? key, required this.texto}) : super(key: key);

  @override
  State<AnounsTeacherPage> createState() => _AnounsTeacherPageState();
}

class _AnounsTeacherPageState extends State<AnounsTeacherPage> {

   var cardDetailTheacerModel= CardDetailTeacherModel(
    1, 
    "Bottle", 
    "Imagem Gerada por IA."
  );

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("Anouns")),

        body: ConstrainedBox(
          constraints: BoxConstraints(
            
            maxHeight: MediaQuery.of(context).size.height
          ),

          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200,),

                  Container(
                    child: Text(widget.texto, style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),),
                  ),

                  SizedBox(height: 12,),

                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter trasnlation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),

                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
                  ),

                  Expanded(child: Container(),),

                  Hero(
                    tag:cardDetailTheacerModel.id,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => card_detail.CardDetailTeacher(
                          cardDetailTeacher: cardDetailTheacerModel,
                        )));
                      },
                      style: ButtonStyle(
                          // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 193, 172, 16)),
                      ),
                      child: Text("Dip", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
                    ),
                  ),

                  SizedBox(height: 40,),



                ],
              ),
            ),
          ),

        ),

      )
    );
  }
}