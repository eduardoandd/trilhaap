import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnounsTeacherPage extends StatelessWidget {
  final String texto;
  const AnounsTeacherPage({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: Center(
        child: Container(
          child: Text(texto),
        ),
      ),
    );
  }
}