import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/title.dart';
import 'package:news_app/network/model/respons.dart';
import 'package:news_app/screens/firebaseservice.dart';
import 'package:news_app/screens/news.dart';


class sourcesPage extends StatefulWidget {
  const sourcesPage({Key key,  this.context,  this.posts}) : super(key: key);
  final BuildContext context;
  final List<Articles> posts;
  @override

  State<StatefulWidget> createState() => _sourcesPageState(context,posts);
}

class _sourcesPageState extends State<sourcesPage> {
  final List<Articles> posts;
  final BuildContext context;
  User user = FirebaseAuth.instance.currentUser;

  _sourcesPageState(this.context,this.posts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.deepPurpleAccent,
        leading: CircleAvatar(backgroundImage: NetworkImage(user.photoURL),minRadius: 10),
        title: const Text("Indian News Sources"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                 FirebaseService service = new FirebaseService();
                 await service.signOutFromGoogle();
                 Navigator.pushReplacementNamed(context, '/signIn');
              },
              icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return
                  Card(
                    child: ListTile(
                      title: Heading(title: posts[index].source.name,
                          colour: Colors.black),
                      trailing: IconButton(
                          icon: const Icon(Icons.bookmark_add_outlined),
                          onPressed: () {}
                          ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsPage(posts: posts, index: index, context: context)

                             ),
                        );
                      },
                    ),
                  );
              }
          ),
        ),
      ),
    );
  }
}
