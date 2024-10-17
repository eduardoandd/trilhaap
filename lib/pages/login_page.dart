

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 30, 58),

      body: SizedBox(
        width: double.infinity,
        
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 250,),

            Container(
              width: 350,height: 350, color: Color.fromARGB(255, 204, 78, 73) ,
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [

                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: const Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal:30),height: 30, color:Color.fromARGB(255, 248, 248, 247),
                      child: Text("Informe seu e-mail"),
                    ),

                    const SizedBox(height: 10,),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal:30),height: 30, color:Color.fromARGB(255, 248, 248, 247),
                      child: Text("Informe a senha"),
                    ),

                    const SizedBox(height: 30,),

                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal:30),height: 30, color:Color.fromARGB(255, 248, 248, 247),
                      child: Text("Logar"),
                    ),
                  ]
                ),
              )

            )
          ],
        ),
      ),
    );
  }
}