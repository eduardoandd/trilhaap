import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/widgets/text_label.dart';

class RegisterPageTeacher extends StatelessWidget {

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController dataController = TextEditingController(text: "");

  RegisterPageTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Register")),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

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
            TextButton(onPressed: (){print(nameController.text);}, child: Text("Salvar"))

          ]
        ),
      ),
    );
  }
}