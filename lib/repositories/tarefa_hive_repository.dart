import 'package:hive/hive.dart';

import '../model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if(Hive.isBoxOpen('tarefaModel')){
      _box = Hive.box('tarefaModel');
    }
    else{
      _box = await Hive.openBox('tarefaModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaModel) {
    _box.add(tarefaModel);
  }

  alterar(TarefaHiveModel tarefaHiveModel){
    tarefaHiveModel.save();
  }

  excluir(TarefaHiveModel tarefa){
    tarefa.delete();
  }

  List<TarefaHiveModel> obterDados(bool concluido) {
    if (concluido) {
      return _box.values.cast<TarefaHiveModel>().toList();
    }
    else{
      return _box.values.cast<TarefaHiveModel>().where(
        (element) => !element.concluido
      ).toList();
    }
  }
}