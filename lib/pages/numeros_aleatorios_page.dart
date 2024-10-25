// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumeroAleatoriosPage extends StatefulWidget {
  const NumeroAleatoriosPage({Key? key}) : super(key: key);

  @override
  State<NumeroAleatoriosPage> createState() => _NumeroAleatoriosPageState();
}

class _NumeroAleatoriosPageState extends State<NumeroAleatoriosPage> {

  int? numeroGerado=0;
  int? qtdCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QTD_CLIQUES= "qtd_cliques";
  late SharedPreferences? storage;



  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage?.getInt(CHAVE_NUMERO_ALEATORIO);
      qtdCliques = storage?.getInt(CHAVE_QTD_CLIQUES);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gerador de números aleaórios.")
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
            storage?.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
            storage?.setInt(CHAVE_QTD_CLIQUES, qtdCliques!);
            // await storage?.remove(CHAVE_NUMERO_ALEATORIO);
          },
        ),
      ),
    );
    
  }
  
}