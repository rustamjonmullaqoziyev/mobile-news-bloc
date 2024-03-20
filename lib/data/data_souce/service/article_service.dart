import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ArticleService {
  ArticleService(this._dio);

  final Dio _dio;

  Future<Response> getArticle(
      {required String country,
      required String category,
      required String sortBy}) async {
    final queryParamete = {
      "country": country,
      "category": category,
      "sortBy": sortBy
    };
    final response =
        await _dio.get("top-headlines", queryParameters: queryParamete);
    return response;
  }
}
