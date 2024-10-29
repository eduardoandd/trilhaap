// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaap/model/configuracoes_model.dart';
import 'package:trilhaap/repositories/configuracoes_repository.dart';

import '../../service/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {

  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();


  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaUsuarioController = TextEditingController();
  // late Box boxConfiguracoes;



  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text= configuracoesModel.nomeUsuario;
    alturaUsuarioController.text= configuracoesModel.altura.toString();

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
                value: configuracoesModel.recebeNotificacoes, 

                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.recebeNotificacoes = value;
                  });
                }
              ),
              SwitchListTile(
                title: Text("Tema escuro"),
                value: configuracoesModel.modoEscuro, 

                onChanged: (bool value){
                setState(() {
                  configuracoesModel.modoEscuro = value;
                });
              }),
              TextButton(
                onPressed: () async{
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configuracoesModel.altura = double.parse(alturaUsuarioController.text);                  
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
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                  configuracoesRepository.salvar(configuracoesModel);
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