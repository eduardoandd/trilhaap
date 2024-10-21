import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _Pagina1PageState();
}

class _Pagina1PageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.green,

      body:Center(
        child: Container(

          child:Text("Teste"),  
        ),
      )
    );
  }
}