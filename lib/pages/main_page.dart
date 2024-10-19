// ignore: implementation_imports
// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/pagina1.dart';
import 'package:trilhaap/pages/pagina2.dart';

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
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:20, horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity, 
                    child: Text("Dados cadastrais"))
                  ,onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DadosCadastraisPage()));
                  },),
                Divider(color: Color.fromARGB(255, 187, 184, 184),),

                SizedBox(height: 10,),

                InkWell(
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity, 
                    child: Text("Termos de uso"))
                  ,onTap: () {},),
                Divider(color: Color.fromARGB(255, 187, 184, 184),),

                SizedBox(height: 10,),

                InkWell(
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity, 
                    child: Text("Configurações"))
                  ,onTap: () {},),
                Divider(color: Color.fromARGB(255, 187, 184, 184),),
              ],
            ),
          ),
        ),
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