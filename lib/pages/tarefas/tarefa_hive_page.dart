// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/model/tarefa_hive_model.dart';
import 'package:trilhaap/repositories/tarefa_hive_repository.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';

class TarefaHivePage extends StatefulWidget {
  const TarefaHivePage({Key? key}) : super(key: key);
  


  @override
  State<TarefaHivePage> createState() => _TarefaHivePageState();
}

class _TarefaHivePageState extends State<TarefaHivePage> {

  late TarefaHiveRepository tarefaHiveRepository;
  var descricaoController = TextEditingController();
  var _tarefas = <TarefaHiveModel>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async{

    tarefaHiveRepository = await TarefaHiveRepository.carregar();

    _tarefas = tarefaHiveRepository.obterDados(apenasNaoConcluidos);

    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () {
          descricaoController.text="";
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
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Cancelar")
                  ),

                  TextButton(

                    onPressed: () async{
                      await tarefaHiveRepository.salvar(
                        TarefaHiveModel.criar(descricaoController.text, false)
                      );
                      Navigator.pop(context);
                      obterTarefas();
                      setState(() {});
                    }, 
                    child: Text("Salvar")
                  )
                ],
              );
            }
          );
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
                  Text("Apenas não concluidos", style: TextStyle(fontSize: 18),),
                  Switch(
                    value: apenasNaoConcluidos, 
                    onChanged: (bool value) {
                      apenasNaoConcluidos=value;
                      obterTarefas();
                    } ,
                  )
                 ],
               ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index){
                  var tarefa=_tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async{
                      tarefaHiveRepository.excluir(tarefa);
                      obterTarefas();
                    },
                    key: Key(tarefa.key.toString()),
                    child: ListTile(
                      title: Text(tarefa.descricao.toString()),
                      trailing: Switch(
                        onChanged: (bool value) async {
                         tarefa.concluido = value;
                         tarefaHiveRepository.alterar(tarefa);
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