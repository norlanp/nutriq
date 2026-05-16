import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/network/logging_interceptor.dart';
import 'package:nutriq/core/network/retry_interceptor.dart';
import 'package:nutriq/core/network/user_agent_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.addAll([
    UserAgentInterceptor(ref),
    AppLoggingInterceptor(),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
      ],
    ),
  ]);

  return dio;
});