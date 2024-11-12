import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(post.title),
            ),
          );
        },
        itemCount:posts.length ,
      ),
    ));
  }
}
