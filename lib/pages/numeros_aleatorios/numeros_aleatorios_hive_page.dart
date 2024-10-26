// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/app_storage_service.dart';

class NumeroAleatoriosHivePage extends StatefulWidget {
  const NumeroAleatoriosHivePage({Key? key}) : super(key: key);

  @override
  State<NumeroAleatoriosHivePage> createState() => _NumeroAleatoriosHivePageState();
}

class _NumeroAleatoriosHivePageState extends State<NumeroAleatoriosHivePage> {

  int? numeroGerado=0;
  int? qtdCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QTD_CLIQUES= "qtd_cliques";
  late Box boxNumerosAleatorios;


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{

    if(Hive.isBoxOpen("box_numeros_aleatorios")){
      boxNumerosAleatorios= Hive.box('box_numeros_aleatorios');
    }
    else{
      boxNumerosAleatorios= await Hive.openBox('box_numeros_aleatorios');
    }
    numeroGerado =  boxNumerosAleatorios.get('numeroGerado')?? 0;
    qtdCliques =  boxNumerosAleatorios.get('qtdCliques')?? 0;
    setState(() {
      
    });
    
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hive.")
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null ? "Nenhum número gerado" : numeroGerado.toString(), 
                style: TextStyle(fontSize: 18),
              ),
              Text(
                qtdCliques == null ? "Nenhum clique efetuado" : qtdCliques.toString(), 
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: () async {
            // final storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado= random.nextInt(1000);
              qtdCliques = (qtdCliques == null? 0 : qtdCliques! + 1);
            });
            await boxNumerosAleatorios.put('numeroGerado', numeroGerado);
            await boxNumerosAleatorios.put('qtdCliques', qtdCliques);
            // await storage?.remove(CHAVE_NUMERO_ALEATORIO);
          },
        ),
      ),
    );
    
  }
  
}