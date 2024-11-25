import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:convert/convert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../model/characters_model.dart';
import 'package:crypto/crypto.dart' as crypto;

class CharacterRepository{
  Future<CharactersModel> getCharacters(int offset) async{

    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = "c289115fc65ada8552551809d71b1f8a";
    var privateKey = "dae53955c9e7c55700cc1131776fde05f082d2b7";
    var hash = _generateMd5(ts + privateKey + publicKey);

    var query = "offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash";
    var result  = await dio.get("http://gateway.marvel.com/v1/public/characters?$query");

    var charactersModel = CharactersModel.fromJson(result.data);

    return charactersModel;
  }

  _generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
    
  }
}