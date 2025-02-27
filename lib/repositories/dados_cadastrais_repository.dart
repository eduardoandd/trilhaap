import 'package:hive/hive.dart';

import '../model/dados_cadastrais_model.dart';

class DadosCadastraisRepository{
  static late Box _box;

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    if(Hive.isBoxOpen('dadosCadastraisModel')){
      _box = Hive.box('dadosCadastraisModel');
    }
    else{
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return DadosCadastraisRepository._criar();
  }

  void salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put('dadosCadastraisModel', dadosCadastraisModel);
  }

  DadosCadastraisModel obterDados(){
    var dadosCadastraisModel = _box.get('dadosCadastraisModel');

    if (dadosCadastraisModel == null){
      return DadosCadastraisModel.vazio();
    }
    return dadosCadastraisModel;
  }

  
}