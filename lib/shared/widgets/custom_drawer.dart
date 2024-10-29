// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaap/pages/configuracoes/configuracoes_shared_preferences_page.dart';
import 'package:trilhaap/pages/login_page.dart';
import 'package:trilhaap/pages/numeros_aleatorios/numeros_aleatorios_hive_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((10))
                    ), 
                    builder: (BuildContext bc){
                      return Wrap(
                        children: [
                          ListTile(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            title: Text("Camera"),
                            leading: Icon(Icons.camera),
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            title: Text("Galeria"),
                            leading: Icon(Icons.album),

                          ),
                        ],  
                      );
                  }); 
                },
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
                  accountName: Text("Eduardo"), 
                  accountEmail: Text("eduardo@gmail.com"),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                  width: double.infinity, 
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      SizedBox(width: 5,),
                      const Text("Dados cadastrais"),
                    ],
                  ))
                ,onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  DadosCadastraisPage()));
                },),
              Divider(color: Color.fromARGB(255, 93, 92, 92),),

              SizedBox(height: 10,),

              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                  width: double.infinity, 
                  child: Row(
                    children: [
                      const Icon(Icons.info),
                      SizedBox(width: 5,),
                      const Text("Termos de uso"),
                    ],
                  ))
                ,onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((10))
                    ),
                    context: context, 
                    builder: (BuildContext bc){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            "Termos de uso e privacidade",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height:8),
                          Text(
                            "Como Deleuze eloquentemente mostrou, o início da atividade geral de formação de conceitos nos obriga a inferir a invalidez da condição de verdade de proposições elementares como ((p ^ ~q) -> (~r v (p <-> r))). Acabei de provar que o desafiador cenário globalizado marca a autonomia do pensamento em relação ao fluxo das regras de conduta normativas. Se estivesse vivo, Foucault diria que a implausibilidade da tábula rasa acarreta um processo de reformulação e modernização das condições epistemológicas e cognitivas exigidas.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
                },),
              Divider(color: Color.fromARGB(255, 93, 92, 92),),

              SizedBox(height: 10,),

              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                  width: double.infinity, 
                  child: Row(
                    children: [
                      const Icon(Icons.album),
                      SizedBox(width: 5,),
                      const Text("Confgurações"),
                    ],
                  ))
                ,onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (bc) =>
                        ConfiguracoesHivePage()
                  ));
                },),

              Divider(color: Color.fromARGB(255, 93, 92, 92),),
              SizedBox(height: 10,),

              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                  width: double.infinity, 
                  child: Row(
                    children: [
                      const Icon(Icons.numbers),
                      SizedBox(width: 5,),
                      const Text("Gerador de números"),
                    ],
                  ))
                ,onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (bc) =>
                        NumeroAleatoriosHivePage()
                  ));
                },),

                Divider(color: Color.fromARGB(255, 93, 92, 92),),
                SizedBox(height: 10,),

              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                  width: double.infinity, 
                  child: Row(
                    children: [
                      const Icon(Icons.exit_to_app),
                      SizedBox(width: 5,),
                      const Text("Sair"),
                    ],
                  )),
                  onTap: () {
                    showDialog(context: context, builder: (BuildContext bc){
                      return AlertDialog(
                        alignment: Alignment.centerLeft,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((10))
                        ),
                        title: Text("Mep app", style: TextStyle(fontWeight: FontWeight.bold),),
                        content: Wrap(
                          children: [
                            Text("Você sairá do aplicativo!"),
                            Text("Deseja realmente sair do Aplicativo?"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: Text("Não")
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => LoginPage())
                              );
                            }, 
                            child: Text("Sim")
                          )
                        ],
                      );
                    });
                  },
              ),

            ],
          ),
        );
  }
}