import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaap/model/post_model.dart';
import 'package:trilhaap/repositories/posts/posts_repository.dart';

class PostsHttpRepositories implements PostsRepository {
  @override
  Future<List<PostModel>> getPostos() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
