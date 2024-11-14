// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/comment_model.dart';
import 'package:trilhaap/repositories/comments_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var comments = <CommentModel>[];
  var commentsRepository = CommentsRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);

    setState(() {
      
    });
    
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Comentários do Post: ${widget.postId}")
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: comments.length == 0 ? 
        Center(child: CircularProgressIndicator()) : 
        ListView.builder(
          itemBuilder: (_, index) {
            var comment = comments[index];

            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(comment.name.substring(0,6)),
                        Text(comment.email),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(comment.body),
                  ],
                ),
              )
            );
          },
          itemCount: comments.length,
        ),
      ),
    ));
  }
}
