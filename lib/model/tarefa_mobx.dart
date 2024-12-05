// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';

// Include generated file
part 'tarefa_mobx.g.dart';

// This is the class used by rest of your codebase
class TarefaStore = _TarefaStore with _$TarefaStore;


abstract class _TarefaStore with Store {

  final String id = UniqueKey().toString();

  @observable
  String descricao = "";

  @observable
  bool concluido = false;

  _TarefaStore(this.descricao, this.concluido);

  @action
  alterar(String pdescricao, bool pconcluido){
    descricao = pdescricao;
    concluido = pconcluido;
  }


}