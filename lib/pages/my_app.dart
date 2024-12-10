// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/pages/home/home_page.dart';
import 'package:trilhaap/pages/splash_screen/splash_screen_delay_page%20.dart';
import 'package:trilhaap/pages/splash_screen/splash_screen_page.dart';
import 'package:trilhaap/repositories/tarefa_provider_repository.dart';
import 'package:trilhaap/service/contador_service.dart';
import 'package:trilhaap/service/dark_mode_service.dart';
import 'package:get/get.dart';

import 'expanded_pratica.dart';
import 'login/main_page.dart' as home;
import 'teacher/login_page_teacher.dart' as teacher;
import 'login_page.dart' as login;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
        ChangeNotifierProvider<ContadorService>(create: (_) => ContadorService()),
        ChangeNotifierProvider<TarefaProviderRepository>(create: (_) => TarefaProviderRepository())
      ],
      child: Consumer<DarkModeService>(builder: (_,darkModeService,widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomePage(),
          );
        }
      ),
    );
  }
}
