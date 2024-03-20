import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/constants.dart';
import 'package:mobile_news_with_bloc/data/constants/rest_header_keys.dart';

@lazySingleton
class ApiKeyInterceptor extends QueuedInterceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = {RestHeaderKeys.apiKey: Constants.apiKey};
    options.headers.addAll(headers);
    options.queryParameters.addAll(headers);
    return handler.next(options);
  }
}
