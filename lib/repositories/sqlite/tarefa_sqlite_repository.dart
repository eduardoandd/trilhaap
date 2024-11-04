import 'package:trilhaap/model/tarefa_sqlite_model.dart';
import 'package:trilhaap/repositories/sqlite/database.dart';


class TarefaSqLiteRepository{

  Future<List<TarefaSqLiteModel>> obterDados(bool apenasNaoConcluidos) async {
  List<TarefaSqLiteModel> tarefas = [];
  try {
    var db = await SqLiteDataBase().ObterDataBase();
    var result = await db.rawQuery(
      apenasNaoConcluidos 
      ? 'SELECT id, descricao, concluido FROM TAREFAS WHERE CONCLUIDO = 0' 
      : 'SELECT id, descricao, concluido FROM TAREFAS'
    );
    // print(result); 
    
    for (var element in result) {

      tarefas.add(
        TarefaSqLiteModel(
          int.parse(element["ID"].toString()),
          element["DESCRICAO"].toString(),
          element["CONCLUIDO"] == 1
        )
      );
    }
  } 
  catch (e) {
    print("Erro ao obter dados: $e");
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
      'DELETE FROM TAREFAS WHERE ID = ?',
      [id]
    );
  }



}