import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_NOME,
  CHAVE_DATA_NASCIMENTO,
  CHAVE_NIVEL_EXPERIENCIA,
  CHAVE_TEMPO_EXPERIENCIA,
  CHAVE_LINGUAGENS_PREFERIDA,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA_USUARIO,
  CHAVE_RECEBER_NOTIFICACAO,
  CHAVE_MODO_ESCURO,
}

class AppStorageService {

  

  Future<String> getDadosCadastraisNome() async{
    return _getString(STORAGE_CHAVES.CHAVE_NOME.toString());
  }
  Future<void> setDadosCadastraisNome(String nome) async{
    _setString(STORAGE_CHAVES.CHAVE_NOME.toString(), nome);
  }

  //==========================

  Future<void> setDadosCadastraisDataNascimento(DateTime data) async{
    await _setString(STORAGE_CHAVES.CHAVE_DATA_NASCIMENTO.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async{
    return _getString(STORAGE_CHAVES.CHAVE_DATA_NASCIMENTO.toString());
  }
  //==========================

  Future<void> setDadosCadastraisNivelExperiencia(String nivel) async{
    await _setString(STORAGE_CHAVES.CHAVE_NIVEL_EXPERIENCIA.toString(), nivel);
  }

  Future<String> getDadosCadastraisNivelExperiencia() async{
    return _getString(STORAGE_CHAVES.CHAVE_NIVEL_EXPERIENCIA.toString());
  }
  //==========================


   Future<void> setDadosCadastraisTempoExperiencia(int tempo) async{
    await _setInt(STORAGE_CHAVES.CHAVE_TEMPO_EXPERIENCIA.toString(), tempo);
  }
  

  Future<int> getDadosCadastraisTempoExperiencia() async{
    return _getInt(STORAGE_CHAVES.CHAVE_TEMPO_EXPERIENCIA.toString());
  }
  //==========================


  Future<void> setDadosCadastraisLinguagensPreferidas(List<String> linguagens) async{
    await _setStringList(STORAGE_CHAVES.CHAVE_LINGUAGENS_PREFERIDA.toString(), linguagens);
  }

  Future<List<String>> getDadosCadastraisLinguagensPreferidas() async{
    return _getStringList(STORAGE_CHAVES.CHAVE_LINGUAGENS_PREFERIDA.toString());
  }
  //==========================





  Future<void> _setString(String chave, String value) async{
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setInt(String chave, int value) async{
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  Future<void> _setBool(String chave, bool value) async{
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

 Future<void> _setStringList(String chave, List<String> values) async{
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  
}