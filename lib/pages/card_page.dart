// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            elevation: 8,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        height:20,
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png"
                      ),
                      Text(
                        'Meu card',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "O Gerador de Lero-lero para TI e informática foi baseado no Fabuloso Gerador de Lero-lero v2.0. Ele é capaz de gerar qualquer quantidade de texto vazio e prolixo, ideal para engrossar uma tese de mestrado, impressionar seu chefe ou preparar discursos capazes de curar a insônia da platéia. Basta informar um título pomposo qualquer (nos moldes do que está sugerido aí embaixo) e a quantidade de frases desejada. Voilá! Em dois nano-segundos você terá um texto - ou mesmo um livro inteiro - pronto para impressão. Ou, se preferir, faça copy/paste para um editor de texto para formatá-lo mais sofisticadamente. Lembre-se: aparência é tudo, conteúdo é nada.",
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: double.infinity,
                    // alignment:  Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text(
                        "Ler mais",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
      
    );
  }
}