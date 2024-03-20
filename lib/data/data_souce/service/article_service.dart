import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/data/constants/rest_end_poind.dart';
import 'package:mobile_news_with_bloc/data/constants/rest_query_keys.dart';

@LazySingleton()
class ArticleService {
  ArticleService(this._dio);

  final Dio _dio;

  Future<Response> getArticle(
      {required String country,
      required String category,
      required String sortBy}) async {
    final queryParameters = {
      RestQueryKeys.queryCountry: country,
      RestQueryKeys.queryCategory: category,
      RestQueryKeys.querySort: sortBy
    };
    final response = await _dio.get(RestEndPoint.topHeadlines,
        queryParameters: queryParameters);
    return response;
  }
}
