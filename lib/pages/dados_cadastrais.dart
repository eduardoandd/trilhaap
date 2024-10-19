// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatelessWidget {
  // final String texto;
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataController = TextEditingController(text: "");
  DateTime? dataNascimento;

  DadosCadastraisPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Meus dados"),),
        // backgroundColor: Color.fromARGB(255, 17, 17, 17),


      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TextButton(onPressed: (){print(nomeController.text);}, child: Text("Salvar"))
            
          ] 
        ),
      ),
  
    );
    
  }
}