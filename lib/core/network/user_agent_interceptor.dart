import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/utils/app_const.dart';

class UserAgentInterceptor extends Interceptor {
  final Ref _ref;

  UserAgentInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cachedUserAgent = _ref.read(userAgentCacheProvider);
    if (cachedUserAgent != null) {
      options.headers['User-Agent'] = cachedUserAgent;
      return handler.next(options);
    }

    AppConst.getUserAgentString().then((userAgent) {
      _ref.read(userAgentCacheProvider.notifier).state = userAgent;
      options.headers['User-Agent'] = userAgent;
      handler.next(options);
    }).catchError((_) {
      handler.next(options);
    });
  }
}

final userAgentCacheProvider = StateProvider<String?>((ref) => null);