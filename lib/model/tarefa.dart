// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  String get id => _id;

  String get descricao => _descricao;

  bool get concluido => _concluido;


  set descricao(String descricao){
    _descricao=descricao;
  }
  set concluido(bool concluido){
    _concluido=concluido;
  }

}