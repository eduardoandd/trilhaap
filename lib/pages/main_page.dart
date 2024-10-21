// ignore: implementation_imports
// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/pagina1.dart';
import 'package:trilhaap/pages/pagina2.dart';
import 'package:trilhaap/shared/widgets/custom_drawer.dart';

import 'dados_cadastrais.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController Pagecontroller = PageController(initialPage: 0);
  int posicaoPagina =0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(title: const Text("Meu app"),),
        drawer: CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: Pagecontroller,
                onPageChanged: (value){

                  setState(() {
                    posicaoPagina=value;
                  });
                },

                children: [
                  Container(
                    child:Pagina1Page()
                  ),
                  Container(
                    child: Pagina2Page(),
                  ),
                  Container(
                    color: Colors.green
                  ),
                ],
              ),
            ),

            BottomNavigationBar(
              
              onTap:(value) {Pagecontroller.jumpToPage(value);
              } ,

              currentIndex: posicaoPagina,items: [
              BottomNavigationBarItem(label: "page1", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "page1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "page1", icon: Icon(Icons.person)),
            ])
          ],
        ),
      ),
    );
  }
}