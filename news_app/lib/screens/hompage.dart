import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/title.dart';
import 'package:news_app/constants/subtitle.dart';
import 'package:news_app/network/model/respons.dart';
import 'package:news_app/screens/news.dart';
import 'package:news_app/bloc/news_sources_bloc.dart';
import 'package:news_app/screens/sourcepage.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsSourcesBloc>(context).fetchNewsSources();

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocBuilder<NewsSourcesBloc, NewsSourcesState>(
              builder: (context, state) {
                if (state is! NewsSourcesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print("Done");
                  final posts = (state as NewsSourcesLoading).album;
                  return sourcesPage(context: context, posts: posts.articles);
                }
              }
          ),
        ),

      ),
    );
  }
}

