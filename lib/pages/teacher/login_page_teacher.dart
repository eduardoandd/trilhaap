

// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trilhaap/pages/teacher/main_page_teacher.dart';
import 'package:trilhaap/pages/teacher/register_teacher_page.dart';
import '../login_page.dart' as login;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isObsercure= true;
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 17, 30, 58),

        body:SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
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
                    // color: Color.fromARGB(255, 238, 112, 112),
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,

                    child:TextField(

                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.only(top:0),
                        hintText: 'Email..',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 112, 112),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size:38,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  ),

                  SizedBox(height:10 ,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    // color: Color.fromARGB(255, 238, 112, 112),
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    // child:Text("Informe a senha", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),),
                    child:TextField(

                      controller: senhaController,
                      obscureText: isObsercure,
                      decoration: InputDecoration(
                        hintText: 'Password..',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 112, 112),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              isObsercure= !isObsercure;
                            });
                          },

                          child: Icon(
                            isObsercure? Icons.visibility_off : Icons.visibility,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    )
                    
                   
                  ),

                  SizedBox(height:30 ,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    
                    width: double.infinity,
                    alignment: Alignment.center,
                    
                    child: SizedBox(
                      width: double.infinity,
                      child:TextButton(
                        onPressed: () {
                          if( emailController.text.trim() == "email" && senhaController.text.trim() == "123" ){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageTeacher()));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Erro"))
                            );
                          }
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
                      ),
                    ),
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
                    
                    child: InkWell (
                      child: Text(
                        "Get Started",  
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
                      ),

                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPageTeacher()));
                      }
                    ),
                  ),

                  SizedBox(height:60 ,),

                ],
              ),
          ),
        ),
        )
    );
  }
}