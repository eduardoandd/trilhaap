import 'package:trilhaap/model/comment_model.dart';

abstract class CommentsRepository{
  Future<List<CommentModel>> retornaComentarios(int postId);
}