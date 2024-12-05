// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/service/contador_service.dart';

import '../../service/counter_mobx_service.dart';

class ContadorMobXPage extends StatelessWidget {
  var contadorMobXService = CounterMobXService();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(
          builder: (context) {
            return Text("${contadorMobXService.contador}", style: TextStyle(fontSize: 26));
          }
        ),
        TextButton(
          onPressed: () {
            contadorMobXService.incrementar();
          },
          child: Text(
            "Incrementar",
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
