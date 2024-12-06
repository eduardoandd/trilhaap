import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trilhaap/model/tarefa_hive_model.dart';
import 'package:trilhaap/pages/main_page.dart';
import 'package:trilhaap/pages/my_app.dart' as app;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trilhaap/repositories/comments/comments_repository.dart';
import 'package:trilhaap/repositories/comments/impl/comments_dio_repository.dart';
import 'package:trilhaap/repositories/posts/impl/posts_dio_repositories.dart';
import 'package:trilhaap/repositories/posts/posts_repository.dart';
import 'package:trilhaap/service/counter_mobx_service.dart';

import 'model/dados_cadastrais_model.dart';
import 'repositories/sqlite/database.dart';


final getIt = GetIt.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<PostsRepository>(PostsDioRepository());
  getIt.registerSingleton<CommentsRepository>(CommentsDioRepository());


  var documentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());

  runApp(const app.MyApp());
}



