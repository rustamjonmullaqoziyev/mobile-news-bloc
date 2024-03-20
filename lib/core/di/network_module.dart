import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/data_souce/intercepters/api_key_intercepter.dart';
import '../constants.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(ApiKeyInterceptor apiKeyInterceptor) {
    final options = BaseOptions(baseUrl: Constants.baseUrl, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final dio = Dio(options);
    dio.interceptors.addAll([_loggerInterceptor, apiKeyInterceptor]);
    return dio;
  }

  PrettyDioLogger get _loggerInterceptor => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      );

  Interceptor get _headerInterceptor => InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) {
          options.headers.addAll(_basicAuthHeaders);
          handler.next(options);
        },
      );

  Map<String, String> get _basicAuthHeaders {
    final headers = <String, String>{};

    return headers;
  }
}
