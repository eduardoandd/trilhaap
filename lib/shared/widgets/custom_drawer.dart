// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../pages/dados_cadastrais.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
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
                      const Icon(Icons.person),
                      SizedBox(width: 5,),
                      const Text("Dados cadastrais"),
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
                      const Icon(Icons.info),
                      SizedBox(width: 5,),
                      const Text("Termos de uso"),
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
                      const Icon(Icons.album),
                      SizedBox(width: 5,),
                      const Text("Confgurações"),
                    ],
                  ))
                ,onTap: () {},),
              Divider(color: Color.fromARGB(255, 187, 184, 184),),
            ],
          ),
        );
  }
}