import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';

import '../../model/lista_tarefas_store.dart';



class TarefaMobXPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;
  var listaTarefasStore = ListaTarefasStore();

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
                          listaTarefasStore.adicionar(descricaoController.text);
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
                  Observer(builder: (_) {
                      return Switch(
                        value: listaTarefasStore.apenasNaoConcluidos,
                        onChanged: listaTarefasStore.setApenasNaoConcluidos
                      );
                    }
                  )
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (context) {
                  return ListView.builder(
                      itemCount: listaTarefasStore.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = listaTarefasStore.tarefas[index];
                        return Observer(
                          builder: (_) {
                            return Dismissible(
                              onDismissed: (DismissDirection dismissDirection) async {
                                listaTarefasStore.excluir(tarefa.id);

                              },
                              key: Key(tarefa.descricao),
                              child: ListTile(
                                title: Text(tarefa.descricao.toString()),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    tarefa.concluido = value;
                                    listaTarefasStore.alterar(tarefa.id, tarefa.descricao, tarefa.concluido);

                                  },
                                  value: tarefa.concluido,
                                ),
                              ),
                            );
                          }
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
