import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
    1: ''' CREATE TABLE TAREFAS (
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
          DESCRICAO TEXT,
          CONCLUIDO INTEGER
        );
    '''
};


class SqLiteDataBase{

  static Database? db;

  Future<Database> ObterDataBase() async {

    if (db == null) {
      return await iniciarBancoDeDados();
    }
    else{
      return db!;
    }
  }
  
  Future<Database> iniciarBancoDeDados() async{
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate:(Database db, int version) async{

        for (var i = 1; i <= scripts.length; i++){
          await db.execute(scripts[i]!);
          print(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = 1; i <= scripts.length; i++){
          await db.execute(scripts[i]!);
          print(scripts[i]!);
        }
      }
    );
    return db;
  }
}