import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/tarefa.dart';

class ListaTarefasController extends GetxController {
  RxList<Tarefa> _tarefas = <Tarefa>[].obs;

  var _apenasNaoConcluidos = false.obs;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value; 
  
  
  List<Tarefa> get tarefas => _apenasNaoConcluidos.value 
  ? _tarefas.where((p0) => !p0.concluido).toList().obs
  : _tarefas.toList().obs;

  

  void setApenasNaoConcluidos(bool value){
    _apenasNaoConcluidos.value = value;

  }

  adicionar(String descricao){
    _tarefas.add(Tarefa(descricao,false));
  }
  excluir(String id){
    var tarefa = _tarefas.removeWhere((element) => element.id == id);    
  }
  alterar(String id, String descricao, bool concluido){
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();

  }


}