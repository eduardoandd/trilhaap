// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/shared/widgets/custom_drawer.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({Key? key}) : super(key: key);

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var controllerCEP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("CEP"),
            TextFormField(
              controller:  controllerCEP,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
            ),
            SizedBox(height: 20,),
            Text("CPF"),
            TextFormField(
              controller:  controllerCEP,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
            ),
            SizedBox(height: 20,),
            Text("CPF"),
            TextFormField(
              controller:  controllerCEP,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
