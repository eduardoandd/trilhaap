// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaap/model/via_cep_model.dart';
import 'package:trilhaap/repositories/via_cep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({Key? key}) : super(key: key);

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCEPModel = ViaCEPModel();
  var viaCEPRepository = ViaCEPRepository();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Consulta de Cep",
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: cepController,
              maxLength: 8,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                var cep = value.trim().replaceAll("-", "");
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viaCEPModel = await viaCEPRepository.consultaCEP(cep);
                  

                } else {}
                setState(() {
                  loading = false;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              viaCEPModel.logradouro ?? "",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              viaCEPModel.uf ?? "",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              viaCEPModel.localidade ?? "",
              style: TextStyle(fontSize: 22),
            ),
            if (loading) CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var response = await http.get(Uri.parse("https://www.google.com"));
          print(response.body);
          print(response.statusCode);
        },
      ),
    ));
  }
}
