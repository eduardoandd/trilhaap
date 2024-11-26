// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/model/tarefa_hive_model.dart';
import 'package:trilhaap/model/tarefa_sqlite_model.dart';
import 'package:trilhaap/repositories/back4app/tarefas_back4app_repository.dart';
import 'package:trilhaap/repositories/tarefa_hive_repository.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';

import '../../model/tarefas_back4app_model.dart';
import '../../repositories/sqlite/tarefa_sqlite_repository.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({Key? key}) : super(key: key);

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var descricaoController = TextEditingController();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var apenasNaoConcluidos = false;
  var loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      loading = true;
    });

    _tarefasBack4App = await tarefaRepository.obterTarefas(apenasNaoConcluidos);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas HTTP"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: Text("Adicionar tarefa"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.criar(
                            TarefaBack4AppModel.criar(descricaoController.text, false)
                          );
                          Navigator.pop(context);
                          obterTarefas();
                          setState(() {loading=false;});
                        },
                        child: Text("Salvar"))
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apenas não concluidos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: apenasNaoConcluidos,
                    onChanged: (bool value) {
                      apenasNaoConcluidos = value;
                      obterTarefas();
                    },
                  )
                ],
              ),
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                        itemCount: _tarefasBack4App.tarefas.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var tarefa = _tarefasBack4App.tarefas[index];
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              await tarefaRepository.deletar(tarefa.objectId);
                              obterTarefas();
                            },
                            key: Key(tarefa.descricao),
                            child: ListTile(
                              title: Text(tarefa.descricao.toString()),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  tarefa.concluido = value;
                                   await tarefaRepository.alterar(tarefa);
                                  obterTarefas();
                                },
                                value: tarefa.concluido,
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
