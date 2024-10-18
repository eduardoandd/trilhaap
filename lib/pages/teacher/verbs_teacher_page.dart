import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerbsTeacherPage extends StatelessWidget {
  final String texto;
  const VerbsTeacherPage({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(texto),),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          child: Text("Verbs"),
        ),
      ),
    );
  }
}