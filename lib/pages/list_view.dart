// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: Text("Usuário"), 
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu){
              if(menu == "opção 2"){}
            },
            itemBuilder: (BuildContext bc){
              return<PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Opção 1",
                  child: Text("Opção 1")
                ),
                PopupMenuItem<String>(
                  value: "Opção 2",
                  child: Text("Opção 2")
                )
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user1),
      ],
    );
  }
}