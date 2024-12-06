import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';
import 'package:trilhaap/service/lista_tarefas_controller.dart';

import '../../model/lista_tarefas_store.dart';



class TarefaGetXPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;
  var listaTarefasController = ListaTarefasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          listaTarefasController.adicionar(descricaoController.text);
                          Navigator.pop(context);
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
                  Obx(() {
                      return Switch(
                        value: listaTarefasController.apenasNaoConcluidos,
                        onChanged: listaTarefasController.setApenasNaoConcluidos 
                      );
                    }
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                  return ListView.builder(
                      itemCount: listaTarefasController.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = listaTarefasController.tarefas[index];
                        return  Dismissible(
                              onDismissed: (DismissDirection dismissDirection) async {
                                listaTarefasController.excluir(tarefa.id);

                              },
                              key: Key(tarefa.descricao),
                              child: ListTile(
                                title: Text(tarefa.descricao.toString()),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    tarefa.concluido = value;
                                    listaTarefasController.alterar(tarefa.id, tarefa.descricao, tarefa.concluido);

                                  },
                                  value: tarefa.concluido,
                                ),
                              ),
                            );
                      });
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
