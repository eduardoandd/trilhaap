import 'package:trilhaap/model/post_model.dart';

abstract class PostsRepository{
  Future<List<PostModel>> getPostos();

}