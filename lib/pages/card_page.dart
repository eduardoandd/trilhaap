// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/card_detail.dart';
import 'package:trilhaap/repositories/card_detail_repository.dart';

import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: cardDetail == null ? LinearProgressIndicator() : InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailPage(
                cardDetail: cardDetail!,
              ))
              );
            },
            child: Hero(
              tag: cardDetail!.id,
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
                            cardDetail!.url,
                          ),
                          Text(
                            cardDetail!.title,
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        cardDetail!.text,
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
            ),
          ),
        )
      ],
      
    );
  }
}