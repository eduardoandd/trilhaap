// ignore: implementation_imports
// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/auro_size_text_page.dart';
import 'package:trilhaap/pages/card_page.dart';
import 'package:trilhaap/pages/comments_page.dart';
import 'package:trilhaap/pages/image_assets.dart';
import 'package:trilhaap/pages/list_view.dart';
import 'package:trilhaap/pages/list_view_h.dart';
import 'package:trilhaap/pages/tarefas/tarefa_hive_page.dart';
import 'package:trilhaap/pages/tarefas/tarefa_sqlite_page.dart';
import 'package:trilhaap/pages/consulta_cep.dart';
import 'package:trilhaap/shared/widgets/custom_drawer.dart';

import '../dados_cadastrais/dados_cadastrais_hive.dart';
import '../indicator_page.dart';

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
                    child:CardPage()
                  ),
                  Container(
                    child: ImageAssetsPage(),
                  ),
                  Container(
                    child: ListViewPage()
                  ),
                  Container(
                    child: ListViewH()
                  ),
                  Container(
                    child: TarefaSQLitePage()
                  ),
                  Container(
                    child: ConsultaCepPage()
                  ),
                  Container(
                    child: IndicatorPage()
                  ),
                  Container(
                    child: AutoSizeTextPage()
                  ),
                  // Container(
                  //   child: CommentsPage()
                  // ),
                ],
              ),
            ),

            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              
              onTap:(value) {Pagecontroller.jumpToPage(value);
              } ,

              currentIndex: posicaoPagina,items: [
              BottomNavigationBarItem(label: "page1", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "page2", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "page3", icon: Icon(Icons.person)),
              BottomNavigationBarItem(label: "page4", icon: Icon(Icons.image)),
              BottomNavigationBarItem(label: "page5", icon: Icon(Icons.list)),
              BottomNavigationBarItem(label: "http", icon: Icon(Icons.list)),
              BottomNavigationBarItem(label: "indicator", icon: Icon(Icons.list)),
              BottomNavigationBarItem(label: "AutoSize", icon: Icon(Icons.list)),
              // BottomNavigationBarItem(label: "Comments", icon: Icon(Icons.abc_rounded)),
            ])
          ],
        ),
      ),
    );
  }
}