import 'package:trilhaap/model/teacher/card_detail_teacher.dart';
import 'package:trilhaap/pages/teacher/card_detail_teacher.dart';

class CardDetailTeacherRepository{
  Future<CardDetailTeacherModel> get() async{
    await Future.delayed(const Duration(seconds: 3));
  
    return CardDetailTeacherModel(
      1, 
      "Bottle", 
      "Imagem Gerada por IA."
    );
  }
}