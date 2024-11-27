import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhaap/model/tarefas_back4app_model.dart';

import 'back4app_custom_dio.dart';

class TarefasBack4AppRepository {
  final _customDio = Back4AppCustomDio();

  TarefasBack4AppRepository();

  Future<void> alterar(TarefaBack4AppModel tarefa) async {
    var id = tarefa.objectId;

    try {
      await _customDio.dio.put("/Tarefas/${id}", data: tarefa.toJsonEndPoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> deletar(String id) async {
    try {
      await _customDio.dio.delete("/Tarefas/${id}");
    } catch (e) {
      throw e;
    }
  }

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var url = "/Tarefas";
    if (naoConcluidas) {
      url += "?where={\"concluido\":false}";
    }
    var result = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefa) async {
    try {
      var response = await _customDio.dio.post("/Tarefas", data: tarefa.toJsonEndPoint());
    } catch (e) {
      throw e;
    }
  }
}
