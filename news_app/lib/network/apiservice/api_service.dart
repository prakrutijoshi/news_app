import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:news_app/network/model/respons.dart';
part 'api_service.g.dart';

@RestApi(baseUrl:'https://newsapi.org/v2')
abstract class ApiService{

  factory ApiService(Dio dio, {String baseUrl})
  {
        dio.options = BaseOptions(
        receiveTimeout: 10000,
        connectTimeout: 10000,
    );
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return _ApiService(dio,baseUrl:baseUrl);

  }
@GET('/top-headlines?country=in&apiKey=e1873f6bfbb640248ec564643df8a023')
Future<Albums> fetchAlbum(){}

}