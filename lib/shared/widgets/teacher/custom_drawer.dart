// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../pages/dados_cadastrais.dart';


class CustonDrawerTeacher extends StatelessWidget {
  const CustonDrawerTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 17, 30, 58) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 238, 112, 112)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              accountName: Text("Eduardo"), 
              accountEmail: Text("eduardo@gmail.com"),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.book, color:Colors.white ,),
                    SizedBox(width: 5,),
                    const Text("Books", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DadosCadastraisPage()));
              },),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),
            SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.add_link_sharp,color:Colors.white),
                    SizedBox(width: 5,),
                    const Text("Verbs", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {},),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),
            SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.phone,color:Colors.white),
                    SizedBox(width: 5,),
                    const Text("Anouns", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {},),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),
          ],
        ),
      );
  }
}