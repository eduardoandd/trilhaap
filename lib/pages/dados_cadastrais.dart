// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/repositories/nivel_repository.dart';

import '../repositories/linguagens_repository.dart';
import '../shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {

  DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  // final String texto;
  TextEditingController nomeController = TextEditingController(text: "");

  TextEditingController dataController = TextEditingController(text: "");

  DateTime? dataNascimento;

  var niveis = [];
  var nivelRepository= NivelRepository();
  var linguagensRepository= LinguagensRepository();
  var nivelSelecionado = "";
  var linguagens = [];
  var linguagensSelecionadas = [];
  double salarioEscolhido=1000;

  int? tempoExperiencia=0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  // ESPECIFICA O TIPO DE RETORNO
  List<DropdownMenuItem<int>> returnItens(int quantidade_maxima){
    var itens = <DropdownMenuItem<int>>[];

    for(var i = 0; i <= quantidade_maxima; i++){
      itens.add(DropdownMenuItem(
          child: Text(i.toString()),
          value: i,
        )
      );
    }
    return itens;
  }

  @override
  
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Meus dados"),),
        // backgroundColor: Color.fromARGB(255, 17, 17, 17),


      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

        child: salvando? Center(child: CircularProgressIndicator()) : ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            TextLabel(texto: "Nome"), // WIDGET PERSONALIZADO
            TextField(
              controller: nomeController,
            ),

            SizedBox(height: 10,),

            TextLabel(texto: "Data de nascimento"),
            TextField(
              controller: dataController,
              readOnly: true,

              onTap: () async{
                var data= await showDatePicker(
                  context: context, 
                  initialDate: DateTime(2000,1,1), 
                  firstDate: DateTime(1900,1,1), 
                  lastDate: DateTime(2024,12,31)
                );
                if (data != null){
                  dataController.text=data.toString();
                  dataNascimento=data;
                }
              },
            ),
            TextLabel(texto: "Nível de experiência"),

            Column(
              children:
                niveis.map(
                  (nivel) => RadioListTile(
                  title: Text(nivel.toString()),
                  selected: nivelSelecionado == nivel,
                  value: nivel.toString(), 
                  groupValue: nivelSelecionado, 
                  onChanged: (value){
                    print(value);
                    setState(() {
                      nivelSelecionado=value.toString();
                    });
                  }
                ),
              ).toList(),
              
            ),            
            TextLabel(texto: "Tempo de experiencia"),
            DropdownButton(
              hint: Text(""),
              value: tempoExperiencia,
              isExpanded: true,
              items: returnItens(50),
              onChanged:(value) {
                setState(() {
                  tempoExperiencia = int.parse(value.toString());
                });
              }
            ),
            TextLabel(texto: "Linguagens preferidas"), 
            Column(
              children: linguagens.map((linguagem) => CheckboxListTile(
                  title: Text(linguagem),
                  value: linguagensSelecionadas.contains((linguagem)), 
                  onChanged: (bool? value) {
                    if (value!) {
                      setState(() {
                        linguagensSelecionadas.add(linguagem);
                        print(linguagem);
                      });
                    }
                    else{
                      setState(() {
                        print(linguagensSelecionadas);
                        linguagensSelecionadas.remove(linguagem);
                        print(linguagensSelecionadas);
                      });
                    }
                  },
                ),).toList()
            ),


            TextLabel(texto: "Pretensão salarial R\$ ${salarioEscolhido.round().toString()}"), 
            Slider(
              min:1000,
              max: 50000,
              value: salarioEscolhido, 
              onChanged:(double value) {
                setState(() {
                  salarioEscolhido = (value / 100).round() * 100;
                  if (salarioEscolhido > 10000 && salarioEscolhido < 30000){
                    salarioEscolhido=(value / 500).round() * 500;
                  }
                  else if(salarioEscolhido > 30000){
                    salarioEscolhido=(value / 1000).round() * 1000;
                  }

                  // print(salarioEscolhido);
                });
              }
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  salvando=false;
                });

                if(nomeController.text.trim() == ""){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("O nome deve ser preenchido")));
                    return;
                }
                if(dataNascimento == null){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Data de nascimento deve ser preenchida")));
                    return;
                }
                if(nivelSelecionado.trim() == ""){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("O nível de experiencia deve ser preenchido")));
                    return;
                }
                if(linguagensSelecionadas.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Sua linguagem preferida deve ser preenchido")));
                    return;
                }
                setState(() {
                  salvando=true;
                });
                Future.delayed(Duration(seconds: 2), (){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Dados salvos com sucesso")));
                    // setState(() {
                    //   salvando=false;
                    // });
                  Navigator.pop(context);
                });
              }, 
              
              child: Text("Salvar"))
          ] 
        ),
      ),
  
    );
    
  }
}