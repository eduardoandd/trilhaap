import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pagina1Page extends StatefulWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  State<Pagina1Page> createState() => _Pagina1PageState();
}

class _Pagina1PageState extends State<Pagina1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green,

      body:Center(
        child: Container(

          child:Text("Teste"),  
        ),
      )
    );
  }
}