import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:15),
      child: Text(
        texto, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }
}