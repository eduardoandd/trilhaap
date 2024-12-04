import 'package:flutter/cupertino.dart';

class ContadorService extends ChangeNotifier{

  int _contador = 0;

  int get contador => _contador;

  void incrementar(){
    _contador +=1;
    notifyListeners();
  }


}