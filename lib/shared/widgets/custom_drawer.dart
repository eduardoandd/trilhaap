// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:trilhaap/pages/battery/battery_page.dart';
import 'package:trilhaap/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaap/pages/configuracoes/configuracoes_shared_preferences_page.dart';
import 'package:trilhaap/pages/connectivity_plus_page.dart';
import 'package:trilhaap/pages/login_page.dart';
import 'package:trilhaap/pages/numeros_aleatorios/numeros_aleatorios_hive_page.dart';
import 'package:trilhaap/pages/post_page.dart';
import 'package:trilhaap/pages/tarefas/tarefa_http_page.dart';
import 'package:trilhaap/repositories/back4app/tarefas_back4app_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../pages/characters/characters_page.dart';
import '../../pages/dados_cadastrais/dados_cadastrais_hive.dart';
import '../../repositories/marvel/characters/characters_repository.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((10))),
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Camera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Galeria"),
                          leading: Icon(Icons.album),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              accountName: Text("Eduardo"),
              accountEmail: Text("eduardo@gmail.com"),
            ),
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.floppyDisk),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Dados cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DadosCadastraisHivePage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Termos de uso"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((10))),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            "Termos de uso e privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Como Deleuze eloquentemente mostrou, o início da atividade geral de formação de conceitos nos obriga a inferir a invalidez da condição de verdade de proposições elementares como ((p ^ ~q) -> (~r v (p <-> r))). Acabei de provar que o desafiador cenário globalizado marca a autonomia do pensamento em relação ao fluxo das regras de conduta normativas. Se estivesse vivo, Foucault diria que a implausibilidade da tábula rasa acarreta um processo de reformulação e modernização das condições epistemológicas e cognitivas exigidas.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Intl"),
                  ],
                )),
            onTap: () {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBR = NumberFormat('#,###.0#', 'pt_BR');
              print(f.format(12.345));
              print(fBR.format(12.345));
              var data = DateTime(2650, 05, 09);
              print(DateFormat('EEEE', 'en_US').format(data));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Informações pacote"),
                  ],
                )),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;

              print(appName);
              print(packageName);
              print(version);
              print(buildNumber);
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Informações do dispositivo"),
                  ],
                )),
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
              print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

              IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
              print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

              WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
              print('Running on ${webBrowserInfo.userAgent}');
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.album),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Confgurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => ConfiguracoesHivePage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Gerador de números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  // ss
                  context,
                  MaterialPageRoute(
                      builder: (bc) => NumeroAleatoriosHivePage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Posts"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (bc) => PostsPage()));
            },
          ),
           Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.wifi),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Conexão"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (bc) => ConnectivityPlus()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.headphones_battery_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Herois"),
                  ],
                )),
            onTap: () async {
              var characterRepository = CharacterRepository();
              var heroes = await characterRepository.getCharacters(0);
              print(heroes);

              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => CharactersPage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.battery_2_bar),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Bateria"),
                  ],
                )),
            onTap: () async {
              var characterRepository = CharacterRepository();
              var heroes = await characterRepository.getCharacters(0);
              print(heroes);

              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (bc) => BatteryPage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.battery_2_bar),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Dio"),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse("https://dio.me"));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.battery_2_bar),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Maps"),
                  ],
                )),
            onTap: () async {
              await launchUrl(
                  Uri.parse("google.navigation:q=Orlando FL&mode=d"));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.share),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Compartilhar"),
                  ],
                )),
            onTap: () {
              Share.share('Olhem esse site: https://dio.me');
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.share),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Diretorio"),
                  ],
                )),
            onTap: () async {
              Directory directory = await path_provider.getTemporaryDirectory();
              print(directory.path);
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.headphones_battery_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Tarefas HTTP"),
                  ],
                )),
            onTap: () async {
              var tarefa = TarefasBack4AppRepository();
              var tarefas = await tarefa.obterTarefas(false);
              print(tarefas);

              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => TarefaHttpPage()));
            },
          ),
          Divider(
            color: Color.fromARGB(255, 93, 92, 92),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    const Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((10))),
                      title: Text(
                        "Mep app",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Wrap(
                        children: [
                          Text("Você sairá do aplicativo!"),
                          Text("Deseja realmente sair do Aplicativo?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text("Sim"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
