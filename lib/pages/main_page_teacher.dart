import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/verbs_teacher.dart';

class MainPageTeacher extends StatefulWidget {
  const MainPageTeacher({Key? key}) : super(key: key);

  @override
  State<MainPageTeacher> createState() => _MainPageTeacherState();
}

class _MainPageTeacherState extends State<MainPageTeacher> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Random Word")),
          drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),

              child: Column(
                children: [
                  InkWell(
                    onTap:() {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Books", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),

                  const SizedBox(height: 10,),

                  InkWell(
                    onTap:() {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Anouns", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),

                  const SizedBox(height: 10,),

                  InkWell(
                    onTap:() {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const 
                      VerbsTeacher(texto: "Verbs")));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Verbs.", style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 112, 111, 111),),






                ]),
            ),
          ),
      )
    );
  }
}