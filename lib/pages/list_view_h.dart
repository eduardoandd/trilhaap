import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/shared/app_images.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({Key? key}) : super(key: key);

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Expanded(
            flex: 1,
            
            child: ListView(
              scrollDirection: Axis.horizontal,

              children:[
                Card(child: Image.asset(AppImages.health)),
                Card(child: Image.asset(AppImages.health)),
                Card(child: Image.asset(AppImages.health)),
              ]
            ),
          ),
          Expanded(flex: 3,child: Container())
        ],
      ) ,
    );
  }
}