import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/subtitle.dart';
import 'package:news_app/constants/description.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/network/model/respons.dart';

class NewsPage extends StatelessWidget {

  NewsPage({ this.posts,this.index, this.context});

  final int index;
  final List<Articles> posts;
  final BuildContext context;

  bool _visible(path) {

    if(path?.isEmpty)
    {
      return false;
    }
    else
      {
        return true;
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent ,
        title: Text(posts[index].source.name +" News List", style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
              children:[
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: _visible(posts[index].title),
                          child: Subtitle(
                            content: posts[index].title,
                            colour: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Container(
                        //   child:
                        //     posts[index].urlToImage?.isEmpty?
                        //          const SizedBox(height: 2)
                        //         :Image.network(posts[index].urlToImage, fit: BoxFit.contain),
                        // ),
                        Visibility(
                          visible: _visible(posts[index].urlToImage),
                          replacement: const SizedBox.shrink(),
                          child: Image.network(posts[index].urlToImage, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 8),
                        Subtitle(content: "Description : ", colour: Colors.deepPurpleAccent),
                        Visibility(
                          visible: _visible(posts[index].description),
                          replacement: const SizedBox.shrink(),
                          child: Desc(
                            content: posts[index].description,
                            colour: Colors.blueGrey,
                          ),
                        ), // header
                        Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                                children: <Widget>[
                                  // Subtitle(content: 'Content', colour: Colors.blueAccent),
                                  // const SizedBox(height: 5),
                                  // Visibility(
                                  //     visible: _visible(posts[index].content),
                                  //     replacement: const SizedBox.shrink(),
                                  //     child: Desc(
                                  //       content: posts[index].content,
                                  //       colour: Colors.blueGrey,
                                  //     ),
                                  //   ),
                                    TextButton(
                                        onPressed: ()
                                          {
                                            _launchURL(posts[index].url);
                                          },
                                        child: const Center(child:  Text("Read Whole Article", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                                      style: ButtonStyle(
                                          foregroundColor:
                                            MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                                          backgroundColor:
                                            MaterialStateProperty.all<Color>(Colors.black87),
                                          side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
                                      ),
                                ]
                            )
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children:  [

                            Row(
                              children: [
                                const Text("Author : ", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                                Visibility(visible: _visible(posts[index].author),replacement: const SizedBox.shrink(),child: Text(posts[index].author, style: const TextStyle(color: Colors.black87, fontSize: 15, fontStyle: FontStyle.italic),)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text("Published At : ", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                                Visibility(visible:_visible(posts[index].publishedAt),replacement: const SizedBox.shrink(),child: Text(posts[index].publishedAt, style: const TextStyle(color: Colors.black87, fontSize: 15, fontStyle: FontStyle.italic),)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                  ]),
          ),
        ),
    );
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';