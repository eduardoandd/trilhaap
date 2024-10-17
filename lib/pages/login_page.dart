

// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Color.fromARGB(255, 17, 30, 58),

        body: SizedBox(
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:100 ,),

              Container(
                // width: 150,
                width: 500,
                height: 250,

                child: Row(
                  children: [
                    Expanded(child: Container(),),
                    
                    Expanded(
                      flex: 10,
                      child: Image.asset(
                              "assets/logo_png.png",
                            ),
                    ),

                    Expanded(child: Container(),),
                  ],
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Color.fromARGB(255, 238, 112, 112),
                height: 30,
                width: double.infinity,
                alignment: Alignment.center,

                child: Row(
                  children: [
                    Expanded(flex:2, child:Text("Informe seu email", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),),
                  ],
                ),
              ),

              SizedBox(height:10 ,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Color.fromARGB(255, 238, 112, 112),
                height: 30,
                width: double.infinity,
                alignment: Alignment.center,
                
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Text("Informe a senha", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),),
                  ],
                ),
              ),

              SizedBox(height:30 ,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
              ),

              Expanded(child:Container() ,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Color.fromARGB(255, 17, 30, 58),
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                
                child: Text("Forget Password",  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200, decoration: TextDecoration.underline)),
              ),

              SizedBox(height:5 ,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Color.fromARGB(255, 17, 30, 58),
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                
                child: Text("Get Started",  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
              ),

              SizedBox(height:60 ,),

            ],
          ),
        )


      )
    );
  }
}