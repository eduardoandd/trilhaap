import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trilhaap/service/gerador_coisas_aleatorias_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var palavraGerada='Clique no botão para gerar uma palavra!';
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Center(child: Text(palavraGerada)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed:  () {
          setState(() {
            palavraGerada= GeradorCoisasAleatorias.geraPalavraAleatoria();
            // print(palavraGerada);
          });

        },
      ),
    );
  }
}

