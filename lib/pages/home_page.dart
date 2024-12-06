// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/pages/brasil_fields_page.dart';
import 'package:trilhaap/pages/getx/contador_getx_page.dart';
import 'package:trilhaap/pages/mobx/tarefa_mobx_page.dart';
import 'package:trilhaap/pages/tarefa_provider_page.dart';
import 'package:trilhaap/pages/tarefas/tarefa_http_page.dart';
import 'package:trilhaap/service/dark_mode_service.dart';

import '../shared/widgets/custom_drawer.dart';
import 'contador/contador_page.dart';
import 'getx/tarefa_getx_page.dart';
import 'mobx/contador_mobx_page.dart';
import 'mobx/contador_mobx_store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var darkModeService = Provider.of<DarkModeService>(context);
    return SafeArea(
        child: Scaffold(
            drawer: CustonDrawer(),
            appBar: AppBar(
              title: Text("Home"),
              actions: [
                Center(child: Text("Dark")),
                Consumer<DarkModeService>(
                  builder: (_,DarkModeService,Widget) {
                    return Switch(value: darkModeService.darkMode, onChanged: (bool value){
                      darkModeService.darkMode = value;

                    });
                  }
                )
              ],
            ),
            body: PageView(controller: pageController, children: [
              Container(
                child: ContadorMobXPage()
              ),
              Container(
                child: TarefaGetXPage(),
              ),
              Container(
                child: ContadorGetXPage(),
              ),
            ]),
            
            ));
  }
}
