// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {


  late SharedPreferences storage; 
  String? nomeUsuario;
  double? altura;
  bool receberNotoficacoes = false;
  bool modoEscuro = false;
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaUsuarioController = TextEditingController();

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_";
  final CHAVE_ALTURA_USUARIO = "CHAVE_ALTURA_";
  final CHAVE_RECEBER_NOTIFICACAO = "CHAVE_NOTIFICACAO";
  final CHAVE_MODO_ESCURO = "CHAVE_MODO_ESCURO";

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      alturaUsuarioController.text=(storage.getDouble(CHAVE_ALTURA_USUARIO) ?? 0).toString();
      nomeUsuarioController.text=storage.getString(CHAVE_NOME_USUARIO) ?? "";
      receberNotoficacoes = storage.getBool(CHAVE_RECEBER_NOTIFICACAO) ?? false;
      modoEscuro = storage.getBool(CHAVE_MODO_ESCURO) ?? false;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Configurações")),
        body: Container(
          child:  ListView(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Nome usuário"
                  ),
                  controller: nomeUsuarioController
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "altura usuário"
                  ),
                  controller: alturaUsuarioController,
                ),
              ),

              SwitchListTile(
                title: Text("Receber Notifcações?"),
                value: receberNotoficacoes, 

                onChanged: (bool value) {
                  setState(() {
                    receberNotoficacoes = !receberNotoficacoes;
                  });
                }
              ),
              SwitchListTile(
                title: Text("Tema escuro"),
                value: modoEscuro, 

                onChanged: (bool value){
                setState(() {
                  modoEscuro = value;
                });
              }),
              TextButton(
                onPressed: () async{
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(CHAVE_ALTURA_USUARIO, double.parse(alturaUsuarioController.text));
                    
                  } catch (e) {
                    showDialog(context: context, builder: (_) {
                      return AlertDialog(
                        title: Text("Meu app"),
                        content: Text("Favor informar uma altura válida"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, 
                            child: Text("OK")
                          )
                        ],
                      );
                    });
                    return;
                  }
                  await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  await storage.setBool(CHAVE_RECEBER_NOTIFICACAO, receberNotoficacoes);
                  await storage.setBool(CHAVE_MODO_ESCURO, modoEscuro);
                  Navigator.pop(context);
                }, 
                child: Text("Salvar")
              )
            ]
          ),
        ),
      )
    );
  }
}