import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RandomWordTeacherPage extends StatelessWidget {
  final String texto;
  const RandomWordTeacherPage({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 30, 169),
      body: Center(
        child: Container(
          child: Text(texto),
        ),
      ),
    );
  }
}