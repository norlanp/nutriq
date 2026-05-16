import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

final _log = Logger('HTTP');

class AppLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.fine('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _log.fine('← ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.warning('${err.type} ${err.requestOptions.uri}: ${err.message}');
    handler.next(err);
  }
}