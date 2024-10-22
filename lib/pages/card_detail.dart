// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({Key? key, required this.cardDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(title: Text("Card detail"),),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    icon: Icon(Icons.close),
                  ),
                  Row(
                    children: [
                      Image.network(
                        height:100,
                        cardDetail.url,
                      ),
                    ],
                  ),
                  Text(
                    cardDetail.title,
                    style: TextStyle(
                      fontSize: 26, 
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Text(
                      cardDetail.text,
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

        ),
      ),
    );
  }
}