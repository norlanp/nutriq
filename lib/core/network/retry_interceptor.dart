import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    this.retries = 2,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
    ],
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final attempt = err.requestOptions.retryCount ?? 0;

    if (attempt >= retries || _isNonRetryable(err)) {
      return handler.next(err);
    }

    final delay = attempt < retryDelays.length
        ? retryDelays[attempt]
        : retryDelays.last;

    await Future.delayed(delay);

    try {
      final response = await dio.fetch(
        err.requestOptions.copyWith(
          extra: {
            ...err.requestOptions.extra,
            'retryCount': attempt + 1,
          },
        ),
      );
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  bool _isNonRetryable(DioException err) {
    if (err.type == DioExceptionType.connectionError) return false;
    if (err.type == DioExceptionType.receiveTimeout) return false;
    if (err.type == DioExceptionType.sendTimeout) return false;
    if (err.type == DioExceptionType.connectionTimeout) return false;

    final statusCode = err.response?.statusCode;
    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      return true;
    }

    return false;
  }
}

extension on RequestOptions {
  int? get retryCount => extra['retryCount'] as int?;
}