// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';
import 'package:trilhaap/model/tarefa_mobx.dart';


part 'lista_tarefas_store.g.dart';



class ListaTarefasStore = _ListaTarefasStore with _$ListaTarefasStore;

abstract class _ListaTarefasStore with Store {  
  ObservableList<TarefaStore> _tarefas = ObservableList<TarefaStore>().asObservable();

  @computed
  List<TarefaStore> get tarefas => apenasNaoConcluidos 
  ? _tarefas.where((element) => !element.concluido).toList()
  : _tarefas.toList();

  @observable
  var _apenasNaoConcluidos = Observable(false);

  
  void adicionar(String descricao){
    _tarefas.add(TarefaStore(descricao, false));
  }

  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;

  @action
  void setApenasNaoConcluidos(bool value){
    _apenasNaoConcluidos.value=value;
  }

  

  @action
  void alterar(String id, String descricao, bool concluido){
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id){
    _tarefas.removeWhere((element) => element.id == id);
  }

 



}