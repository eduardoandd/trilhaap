import 'package:dio/dio.dart';
import 'package:trilhaap/model/tarefas_back4app_model.dart';

class TarefasBack4AppRepository{

  var _dio = Dio();

  TarefasBack4AppRepository(){
    _dio = Dio();

    _dio.options.headers['X-Parse-Application-Id'] = 'qY5LTRlCbwBuv8nDZe3WpAwVilBMahGzP9uPKQei';
    _dio.options.headers['X-Parse-REST-API-Key'] = 'OiRN406NY2TCEZB3l7RCQaaeJJNM5dFcfsTnM6gT';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";

  }

  Future<void> alterar(TarefaBack4AppModel tarefa) async{
    var id = tarefa.objectId;
    
    try {
      await _dio.put("/Tarefas/${id}", data: tarefa.toJsonEndPoint());    
    } catch (e) {
      throw e;
    }

  }

  Future<void> deletar(String id) async{
    
    
    try {
      await _dio.delete("/Tarefas/${id}");    
    } catch (e) {
      throw e;
    }

  }

  

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {

    var url = "/Tarefas";
    if(naoConcluidas) {
      url += "?where={\"concluido\":false}";
    }
    var result = await _dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefa) async{
    
    try {
      var response = await _dio.post("/Tarefas", data: tarefa.toJsonEndPoint());    
    } catch (e) {
      throw e;
    }

  }

  

}