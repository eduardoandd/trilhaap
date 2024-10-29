import 'package:hive/hive.dart';
part 'dados_cadastrais_model.g.dart';

@HiveType(typeId: 0)
class DadosCadastraisModel extends HiveObject{
  @HiveField(0)
  String? nome;

  @HiveField(1)
  DateTime? dataNascimento;

  @HiveField(2)
  String? nivelExp;

  @HiveField(3)
  int? tempoExp;

  @HiveField(4)
  List<String>? linguagens;

  DadosCadastraisModel.vazio(){
    nome = "";
    dataNascimento = null;
    nivelExp = "";
    tempoExp = 0;
    linguagens = [];
  }

  DadosCadastraisModel();


}