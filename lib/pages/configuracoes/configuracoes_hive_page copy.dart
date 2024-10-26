// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {


  String? nomeUsuario;
  double? altura;
  bool receberNotoficacoes = false;
  bool modoEscuro = false;
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaUsuarioController = TextEditingController();
  late Box boxConfiguracoes;


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

    if(Hive.isBoxOpen("box_configuracoes")){
      boxConfiguracoes=Hive.box('box_configuracoes');
    }
    else{
      boxConfiguracoes= await Hive.openBox('box_configuracoes');
    }

    nomeUsuarioController.text= boxConfiguracoes.get('nomeUsuario') ?? "";  
    alturaUsuarioController.text= boxConfiguracoes.get('alturaUsuario')?? 0;
    receberNotoficacoes = boxConfiguracoes.get('receberNotificacoes')?? false;
    modoEscuro = boxConfiguracoes.get('modoEscuro')?? false;

    setState(() {
      
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
                    await boxConfiguracoes.put('alturaUsuario',alturaUsuarioController.text);                    
                  } 
                  catch (e) {
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
                  await boxConfiguracoes.put('nomeUsuario',nomeUsuarioController.text);
                  await boxConfiguracoes.put('receberNotificacoes',receberNotoficacoes);
                  await boxConfiguracoes.put('modoEscuro',modoEscuro);
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