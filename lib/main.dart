import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;

  final List<String> words= ['apple','cat','dog'];

  int _gerarNumeroAleatorio(){

    Random numeroAleatorio = Random();

    return numeroAleatorio.nextInt(1000);
  }

  String _gerarPalavrasAleatorias(){
    Random random = Random();

    return words[random.nextInt(words.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Center(child: Text(_gerarPalavrasAleatorias())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed:  () {
          print(_gerarNumeroAleatorio());

          setState(() {
            _gerarPalavrasAleatorias();
          });

        },
      ),
    );
  }
}

