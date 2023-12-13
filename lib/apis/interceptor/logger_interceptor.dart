// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class LoggerIntercepter extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    print('${options.method} request => $requestPath');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('StatusCode: ${response.statusCode}, Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    print('${options.method} request => $requestPath');
    print('Error: ${err.error}, Message: ${err.message}');
    super.onError(err, handler);
  }
}