import 'package:flutter/cupertino.dart';
import 'package:trilhaap/model/tarefa.dart';

class TarefaProviderRepository extends ChangeNotifier{
  final _tarefas = <Tarefa>[];
  var _apenasNaoConcluidos = false;

  set apenasNaoConluidos(bool value){
    _apenasNaoConcluidos = value;
    notifyListeners();
  }

  bool get  apenasNaoConcluidos => _apenasNaoConcluidos;

  get tarefas => _apenasNaoConcluidos
   ? _tarefas.where((element) => !element.concluido).toList()
   :_tarefas;

  adicionar(Tarefa tarefa){
    _tarefas.add(tarefa);
    notifyListeners();
  }

  remover(String id){
    _tarefas.remove(tarefas.where((element) => element.id == id).first);
    notifyListeners();
  }

  alterar(Tarefa tarefa){
    _tarefas.where((element) => element.id == tarefa.id).first.concluido=tarefa.concluido;
    notifyListeners();
  }
}