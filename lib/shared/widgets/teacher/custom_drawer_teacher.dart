// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/teacher/login_page_teacher.dart';

import '../../../pages/dados_cadastrais/dados_cadastrais_hive.dart';




class CustonDrawerTeacher extends StatelessWidget {
  const CustonDrawerTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 17, 30, 58) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 238, 112, 112)
              ),
              currentAccountPicture: InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
                  
                  onTap: (){
                    showModalBottomSheet(
                      // isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ), 
                      context: context,
                      builder: (BuildContext bc){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 20,
                                  shadowColor: Colors.grey,
                                  child:Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                                          child: CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Color.fromARGB(255, 17, 30, 58),
                                            child: Image.network(
                                                "https://hermes.digitalinnovation.one/assets/diome/logo.png"
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text("Hi, Edu!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
                                        ),
                                        SizedBox(height:3,),
                                        Container(
                                          child:Text(
                                            textAlign: TextAlign.center,
                                            "Do mesmo modo, a consulta aos diversos militantes ainda não demonstrou convincentemente que vai participar na mudança das condições financeiras e administrativas exigidas. As experiências acumuladas demonstram que a crescente influência da mídia aponta para a melhoria do levantamento das variáveis envolvidas. Acima de tudo, é fundamental ressaltar que a consolidação das estruturas assume importantes posições no estabelecimento de todos os recursos funcionais envolvidos. Por conseguinte, o início da atividade geral de formação de atitudes acarreta um processo de reformulação e modernização do investimento em reciclagem técnica.",
                                            style: TextStyle(fontSize: 16)
                                          )
                                        )
                                      ],
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      
                    );
                  },
              ),
              accountName: Text("Eduardo"), 
              accountEmail: Text("eduardo@gmail.com"),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.book, color:Colors.white ,),
                    SizedBox(width: 5,),
                    const Text("Books", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DadosCadastraisHivePage()));
              },),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),

            SizedBox(height: 5,),

            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.add_link_sharp,color:Colors.white),
                    SizedBox(width: 5,),
                    const Text("Verbs", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {},),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),

            SizedBox(height: 5,),

            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.phone,color:Colors.white),
                    SizedBox(width: 5,),
                    const Text("Anouns", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {},),
            Divider(color: Color.fromARGB(255, 187, 184, 184),),

            SizedBox(height: 5,),

            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                width: double.infinity, 
                child: Row(
                  children: [
                    const Icon(Icons.exit_to_app,color:Colors.white),
                    SizedBox(width: 5,),
                    const Text("Sair", style: TextStyle(color: Colors.white),),
                  ],
                ))
              ,onTap: () {
                showDialog(
                  context: context, 
                  builder: (BuildContext bc){
                    return AlertDialog(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      title: Text("Meu app", style: TextStyle(fontWeight: FontWeight.w800),),
                      content: Wrap(
                        children: [
                          Text("Você sairá do aplicativo"),
                          Text("Deseja realmente sair do aplicativo?")
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: Text("Não")
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage())
                            );
                          }, 
                          child: Text("Sim")
                        )
                      ],
                    );
                  }
                );
              },),
          ],
        ),
      );
  }
}