import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trilhaap/model/tarefa_hive_model.dart';
import 'package:trilhaap/pages/main_page.dart';
import 'package:trilhaap/pages/my_app.dart' as app;
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/dados_cadastrais_model.dart';
import 'repositories/sqlite/database.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  var documentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());

  runApp(const app.MyApp());
}



