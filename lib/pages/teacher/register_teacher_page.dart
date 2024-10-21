// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/repositories/teacher/hobbies_teacher_repository.dart';

import '../../repositories/teacher/exp_teacher_repository.dart';
import '../../shared/widgets/text_label.dart';

class RegisterPageTeacher extends StatefulWidget {


  RegisterPageTeacher({Key? key}) : super(key: key);

  @override
  State<RegisterPageTeacher> createState() => _RegisterPageTeacherState();
}

class _RegisterPageTeacherState extends State<RegisterPageTeacher> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController dataController = TextEditingController(text: "");

  var expLevelsRepository = expTeacherRepository();
  var expLevels=[];
  var selectedExp = "";
  var levels = [];
  int? expTime;

  var hobbiesRepository = HobbiesTeacherRepository();
  var hobbies = [];
  var selectedHobbies= [];

  @override
  void initState() {
    expLevels = expLevelsRepository.GetExpLevels();
    hobbies = hobbiesRepository.GetHobbies();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(){
    var levels=expLevelsRepository.GetExpLevels();
    var itens = <DropdownMenuItem<int>>[];
    int index =0;

    levels.forEach((level) {
      itens.add(DropdownMenuItem(
        child: Text(level),
        value:index,
      ));

      index++;
    });

    return itens;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Register")),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TextLabel(texto: "Name"),
            TextField(
              controller:nameController ,
              decoration: InputDecoration(
                hintText: "Seu nome..."
              ),
            ),

            SizedBox(height: 10,),

            TextLabel(texto: "Date of Birth:"),
            TextField(
              controller:dataController ,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Data de nascimento..."
              ),

              onTap: () async {
                var data = await showDatePicker(
                  context: context, 
                  initialDate: DateTime(2000,1,1), 
                  firstDate: DateTime(1900,1,1), 
                  lastDate: DateTime(2024,12,31)
                );

                if (data != null){
                  dataController.text=data.toString();
                }
              },
            ),
            TextLabel(texto: "Exp."),

            DropdownButton(
              hint: Text("Nível de experiência"),
              value: expTime,
              isExpanded: true,
              items: returnItens(), 
              onChanged:(value){
                setState(() {
                  expTime = int.parse(value.toString());
                });
              }
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Container(
                    margin: EdgeInsets.only(top:15),
                    child: 
                    Text(
                      "What do you like to do?", 
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                    Container(
                    margin: EdgeInsets.only(top:3),
                      child: Text(
                        'O que você gosta de fazer?', 
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 118, 117, 117)),
                      ),
                    ),
                ]),
            ),
            Column(
              children: hobbies.map(
                (hobby) => CheckboxListTile(
                  title: Text(hobby),
                  value: selectedHobbies.contains(hobby), 
                  onChanged: (bool? value){
                    setState(() {
                      if (value!){
                        selectedHobbies.add(hobby);
                      }
                      else{
                        selectedHobbies.remove(hobby);
                      }
                    });
                  }
                )
                ).toList(),
            ),

            TextButton(onPressed: (){print(nameController.text);}, child: Text("Salvar"))
          ]
        ),

      ),
    );
  }
}