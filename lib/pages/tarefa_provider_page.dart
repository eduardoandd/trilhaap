import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';

import '../repositories/tarefa_provider_repository.dart';

class TarefaProviderPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

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
                          Provider.of<TarefaProviderRepository>(context,listen: false).adicionar(
                            Tarefa(descricaoController.text, false));
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
                  Consumer<TarefaProviderRepository>(
                    builder: (_,tarefaProviderRepository,widget) {
                      return Switch(
                        value: tarefaProviderRepository.apenasNaoConcluidos,
                        onChanged: (bool value) {
                          Provider.of<TarefaProviderRepository>(context, listen: false).apenasNaoConluidos = value;
                        },
                      );
                    }
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<TarefaProviderRepository>(
                builder: (_,tarefaRepository,widget) {
                  return ListView.builder(
                      itemCount: tarefaRepository.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = tarefaRepository.tarefas[index];
                        return Dismissible(
                          onDismissed: (DismissDirection dismissDirection) async {
                              Provider.of<TarefaProviderRepository>(context,listen: false).remover(tarefa.id);

                          },
                          key: Key(tarefa.descricao),
                          child: ListTile(
                            title: Text(tarefa.descricao.toString()),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                tarefa.concluido = value;
                                Provider.of<TarefaProviderRepository>(context,listen: false).alterar(tarefa);

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
