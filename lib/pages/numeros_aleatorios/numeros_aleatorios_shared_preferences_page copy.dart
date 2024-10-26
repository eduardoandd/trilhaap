// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/app_storage_service.dart';

class NumeroAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumeroAleatoriosSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<NumeroAleatoriosSharedPreferencesPage> createState() => _NumeroAleatoriosSharedPreferencesPageState();
}

class _NumeroAleatoriosSharedPreferencesPageState extends State<NumeroAleatoriosSharedPreferencesPage> {

  int? numeroGerado=0;
  int? qtdCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QTD_CLIQUES= "qtd_cliques";
  AppStorageService storage = AppStorageService();




  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    
    numeroGerado = await storage.getNumeroAleatoriosNumeroGerado();
    qtdCliques = await storage.getNumeroAleatoriosQtdCliques();

    setState(() {
      
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
            await storage.setNumeroAleatoriosNumeroGerado(numeroGerado!);
            await storage.setNumeroAleatoriosQtdCliques(qtdCliques!);
            // await storage?.remove(CHAVE_NUMERO_ALEATORIO);
          },
        ),
      ),
    );
    
  }
  
}