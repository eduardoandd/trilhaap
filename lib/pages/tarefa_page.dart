// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/tarefa.dart';
import 'package:trilhaap/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);
  


  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {

  var tarefaRepository = TarefaRepository();
  var descricaoController = TextEditingController();
  var _tarefas = <Tarefa>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async{

    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.getTarefasNaoConcluidas();
    }
    else{
      _tarefas= await tarefaRepository.getTarefas();
    }
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
                      await tarefaRepository.adicionar(
                        Tarefa(descricaoController.text, false)
                      );
                      Navigator.pop(context);
                      setState(() {
                        
                      });
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
                      await tarefaRepository.remove(tarefa.id);
                      obterTarefas();
                    },
                    key: Key(tarefa.id),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(
                        onChanged: (bool value) async {
                         await tarefaRepository.alterar(tarefa.id, value);
                         obterTarefas();
                        //  print(value);
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