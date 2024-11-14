// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/pages/comments_page.dart';
import 'package:trilhaap/repositories/posts_repositories.dart';

import '../model/post_model.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var postsRepository = PostsRepositories();
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await postsRepository.getPostos();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
        // ignore: prefer_const_constructors
        child: Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          var post = posts[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (_) => CommentsPage(postId: post.id))
              );
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Card(
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(post.body,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        
                      ],
                    ),
                  )
                ),
              ),
            ),
          );
        },
        itemCount: posts.length,
      ),
    ));
  }
}
