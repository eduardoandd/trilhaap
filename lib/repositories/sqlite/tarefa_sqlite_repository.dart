import 'package:trilhaap/model/tarefa_sqlite_model.dart';
import 'package:trilhaap/repositories/sqlite/database.dart';


class TarefaSqLiteRepository{

  Future<List<TarefaSqLiteModel>> obterDados() async{
    List<TarefaSqLiteModel> tarefas = [];
    var db = await SqLiteDataBase().ObterDataBase();
    var result = await db.rawQuery(' SELECT * FROM TAREFAS');

    for (var element in result){
      var model = TarefaSqLiteModel(int.parse(element["id"].toString()),element["descricao"].toString(), element["concluido"] == "1");
      tarefas.add(model);
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSqLiteModel model) async {
    var db = await SqLiteDataBase().ObterDataBase();
    await db.rawInsert(
      'INSERT INTO TAREFAS (DESCRICAO, CONCLUIDO) VALUES(?,?)',
      [
        model.descricao,
        model.concluido
      ]
    );
  }

  Future<void> atualizar(TarefaSqLiteModel model) async {
    var db = await SqLiteDataBase().ObterDataBase();
    await db.rawInsert(
      'UPDATE TAREFAS SET  DESCRICAO =?, CONCLUIDO =? WHERE ID = ?',
      [
        model.descricao,
        model.concluido,
        model.id
      ]
    );
  }

  Future<void> remover(int id) async {
    var db = await SqLiteDataBase().ObterDataBase();
    await db.rawInsert(
      'DELETE TAREFAS WHERE ID = ?',
      [id]
    );
  }



}