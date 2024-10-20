// ignore_for_file: prefer_const_literals_to_create_immutables

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

  var hobbiesRepository = HobbiesTeacherRepository();
  var hobbies = [];
  var selectedHobbies= [];

  @override
  void initState() {
    expLevels = expLevelsRepository.GetExpLevels();
    hobbies = hobbiesRepository.GetHobbies();
    super.initState();
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
            ),

            SizedBox(height: 10,),

            TextLabel(texto: "Data de nascimento:"),
            TextField(
              controller:dataController ,
              readOnly: true,

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

            Column(
              children: expLevels.map(
                (level) => RadioListTile(
                  title: Text(level.toString()),
                  selected: selectedExp == level,
                  value: level.toString(),
                  groupValue: selectedExp,
                  onChanged: (value){
                    setState(() {
                      selectedExp=value.toString();
                    });
                  },
                )).toList()
            ),
            TextLabel(texto: "What do you like to do?"),
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