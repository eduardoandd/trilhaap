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
  var quantidadeClicks= 0;
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste', style: GoogleFonts.roboto()),
      ),
      body: Container(
        color: Color.fromARGB(255, 204, 78, 73),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0), // respiro
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(palavraGerada, style: GoogleFonts.acme(fontSize: 40, color: Colors.white)),
            Text("Quantidade de clicks foi de $quantidadeClicks", style: GoogleFonts.acme(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed:  () {
          setState(() {
            palavraGerada= GeradorCoisasAleatorias.geraPalavraAleatoria();
            numeroGerado=GeradorCoisasAleatorias.geraNumeroAletorio();
            quantidadeClicks+=1;
            // print(palavraGerada);
          });

        },
      ),
    );
  }
}

