import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/network/model/respons.dart';
import 'package:news_app/network/apiservice/api_service.dart';
import 'package:dio/dio.dart' as dio;

part 'news_sources_event.dart';
part 'news_sources_state.dart';

class NewsSourcesBloc extends Bloc<NewsSourcesEvent, NewsSourcesState> {
  NewsSourcesBloc() : super(NewsSourcesInitial()) {

    @override
    Stream<NewsSourcesState> mapEventToState(
        NewsSourcesEvent event,
    ) async* {
      if(event is NewsSourcesLoading)
        {
            print("Loading event");
            fetchNewsSources();
        }else{
            print("else of loading");
      }
    }
  }
  void fetchNewsSources() {
    ApiService(dio.Dio(), baseUrl: 'https://newsapi.org/v2').fetchAlbum().then((album) {
      emit(NewsSourcesLoading(album: album));
    }
    );
  }

}
