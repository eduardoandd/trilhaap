import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trilhaap/model/tarefa_hive_model.dart';
import 'package:trilhaap/pages/main_page.dart';
import 'package:trilhaap/pages/my_app.dart' as app;
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/dados_cadastrais_model.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: ''' CREATE TABLE TAREFAS (
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
          DESCRICAO TEXT,
          CONCLUIDO INTEGER
        );
  '''
};

Future iniciarBancoDeDados() async{
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  await iniciarBancoDeDados();

  runApp(const app.MyApp());
}



