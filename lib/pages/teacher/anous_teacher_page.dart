// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/teacher/card_detail_teacher.dart' as card_detail;
import 'package:trilhaap/repositories/teacher/card_detail_teacher_repository.dart';

import '../../model/teacher/card_detail_teacher.dart';
import '../../shared/app_images.dart';

class AnounsTeacherPage extends StatefulWidget {
  final String texto;
  const AnounsTeacherPage({Key? key, required this.texto}) : super(key: key);

  @override
  State<AnounsTeacherPage> createState() => _AnounsTeacherPageState();
}

class _AnounsTeacherPageState extends State<AnounsTeacherPage> {

   CardDetailTeacherModel? cardDetailTeacherModel;
   var cardDetailTeacherRepository = CardDetailTeacherRepository();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }
  
  void carregarDados() async {
    cardDetailTeacherModel= await cardDetailTeacherRepository.get();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

         cardDetailTeacherModel ==  null? LinearProgressIndicator() : ListTile(
          leading:Image.asset(AppImages.health),
          trailing: Hero(
            tag: cardDetailTeacherModel!.id,
            child: PopupMenuButton<String>(
              onSelected: (menu){
                if(menu =="Dip"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => card_detail.CardDetailTeacher(cardDetailTeacher: cardDetailTeacherModel!,))
                  );
                }
              },

              itemBuilder: (BuildContext bc) {
                return<PopupMenuEntry<String>>[

                  PopupMenuItem<String>(
                    value: "Dip",
                    child: Text("Dip"),
                  )
                ];
              },
            ),
          ),
        ),

        SizedBox(height: 160,),
        
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(widget.texto, style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),),
          ),
        ),

        SizedBox(height: 12,),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter trasnlation",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
        ),

        SizedBox(height: 30,),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
          ),
        ),
      ],
    );
  }
}