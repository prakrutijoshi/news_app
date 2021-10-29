part of 'news_sources_bloc.dart';

@immutable
abstract class NewsSourcesState {}

class NewsSourcesInitial extends NewsSourcesState {}

class NewsSourcesLoading extends NewsSourcesState {
  final Albums album;
  NewsSourcesLoading({this.album});
}