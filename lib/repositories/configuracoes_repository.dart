import 'package:hive/hive.dart';
import 'package:trilhaap/model/configuracoes_model.dart';

class ConfiguracoesRepository{
  static late Box _box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async{

    if(Hive.isBoxOpen('configuracoes')){
      _box = await Hive.openBox('configuracoes');
    }
    else{
      _box = await Hive.openBox('configuracoes');
    }

    return ConfiguracoesRepository._criar();    
  }

  void salvar(ConfiguracoesModel configuracoesModel){

    _box.put(
      'configuracoesModel',{
        'nomeUsuario': configuracoesModel.nomeUsuario,
        'altura': configuracoesModel.altura,
        'receberNotificacoes': configuracoesModel.recebeNotificacoes,
        'modoEscuro': configuracoesModel.modoEscuro,
      }
    );
  }

  ConfiguracoesModel obterDados(){
    var configuracoes=_box.get('configuracoesModel');
    if ( configuracoes == null){
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
      configuracoes['nomeUsuario'], 
      configuracoes['altura'],
      configuracoes['receberNotificacoes'],
      configuracoes['modoEscuro'],
    );

  }

}