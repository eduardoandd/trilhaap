import 'dart:convert';

import 'package:trilhaap/model/via_cep_model.dart';
import 'package:http/http.dart' as http;


class ViaCEPRepository{

  Future<ViaCEPModel> consultaCEP(String cep) async{
    var response = await http
      .get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        return ViaCEPModel.fromJson(json);
      }

      return ViaCEPModel();


  }

}