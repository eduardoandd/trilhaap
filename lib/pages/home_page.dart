import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaap/service/gerador_coisas_aleatorias_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var palavraGerada='Clique no botão para gerar uma palavra!';
  var numeroGerado=0;
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste', style: GoogleFonts.roboto()),
      ),
      body: Center(child: Text(palavraGerada, style: GoogleFonts.acme(fontSize: 60))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed:  () {
          setState(() {
            palavraGerada= GeradorCoisasAleatorias.geraPalavraAleatoria();
            numeroGerado=GeradorCoisasAleatorias.geraNumeroAletorio();
            // print(palavraGerada);
          });

        },
      ),
    );
  }
}

