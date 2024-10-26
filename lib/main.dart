import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaap/pages/main_page.dart';
import 'package:trilhaap/pages/my_app.dart' as app;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);

  runApp(const app.MyApp());
}



