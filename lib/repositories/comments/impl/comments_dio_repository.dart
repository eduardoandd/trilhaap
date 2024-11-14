import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trilhaap/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaap/repositories/comments/comments_repository.dart';


class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts/$postId/comments");

    if(response.statusCode == 200) {
      return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
    }
    else{
      return [];
    }
  }

  
}