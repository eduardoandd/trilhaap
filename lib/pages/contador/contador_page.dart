// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/service/contador_service.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ContadorService>(
          builder: (_,contadorService,widget) {
            return Text(
              contadorService.contador.toString(), 
              style: TextStyle(fontSize: 26)
            );
          }
        ),
        TextButton(onPressed: (){
          Provider.of<ContadorService>(context, listen: false).incrementar();

        },child: Text("Incrementar", style: TextStyle(fontSize: 18),),)
        
      ],
    );
    
  }
}