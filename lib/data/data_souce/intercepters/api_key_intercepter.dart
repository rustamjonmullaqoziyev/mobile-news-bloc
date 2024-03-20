import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiKeyInterceptor extends QueuedInterceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = {'apiKey': "7423d0e723084670b40483e2a5c906ea"};
    options.headers.addAll(headers);
    options.queryParameters.addAll(headers);
    return handler.next(options);
  }
}
