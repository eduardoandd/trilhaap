import 'package:flutter/cupertino.dart';

class DarkModeService extends ChangeNotifier{
  bool _darkMode = false;

  set darkMode(bool value){
    _darkMode = value;
    notifyListeners();
  }

  bool get darkMode => _darkMode;
}