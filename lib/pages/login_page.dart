// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        body: SizedBox(
          width: double.infinity,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90,),
                Row(
                  children: [
                    Expanded(child: Container()),

                    Expanded(
                      flex: 8,
                      child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        // height: 300,
                      ),
                    ),

                    Expanded(child: Container()),
                  ],
                ),

              SizedBox(height: 30,),


              Container(
                child: Text("Já tem cadastro?", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
              ),

              SizedBox(height: 10,),

              Container(
                child: Text("Faça o login e make the change..", style: TextStyle(color: Colors.white, fontSize: 16),),
              ),

              SizedBox(height: 30,),

              Container(
                margin:  EdgeInsets.symmetric(horizontal: 30),
                // color: Colors.white,
                height: 30,

                child: Row(
                  children: [
                    Expanded(child: Text("Informe seu email:", style: TextStyle(color: Colors.white, fontSize: 17))),
                    Expanded(child: Text("Email", style: TextStyle(color: Colors.white, fontSize: 17))),

                    SizedBox(height: 30,),


                  ]
                ),
              ),

              SizedBox(height: 5,),

              Container(
                margin:  EdgeInsets.symmetric(horizontal: 30),
                // color: Colors.white,
                height: 30,

                child: Row(
                  children: [
                    Expanded(child: Text("Informe sua senha:", style: TextStyle(color: Colors.white, fontSize: 17))),
                    Expanded(child: Text("Senha", style: TextStyle(color: Colors.white, fontSize: 17))),
                  ]
                ),
              ),

              SizedBox(height: 30,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                // color: Colors.green,
                // height: 40,
                alignment:  Alignment.center,

                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 104, 57, 114))
                    ),
                    child:Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700 ),),),
                ),
              ),

              Expanded(child: Container()),

              Container(child:Text("Esqueci a senha", style: TextStyle(color: Colors.yellow, fontSize: 17),)),
              SizedBox(height:10 ,),
              Container(child:Text("Criar conta", style: TextStyle(color: Colors.green),)),
              SizedBox(height:70 ,),







            ],
          ),


        ),

        
      )
    );
  }
}