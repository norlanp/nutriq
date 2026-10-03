import 'dart:async';
import 'dart:io';

/// Blocks real network access for the whole test suite.
///
/// Food data comes from live FDC and Open Food Facts endpoints in the app, but
/// tests must never reach them: that would make the suite flaky, slow, and
/// dependent on external services. Any test that attempts a connection fails
/// loudly instead of silently hitting the network.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  HttpOverrides.global = _BlockingHttpOverrides();
  await testMain();
}

class _BlockingHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      _BlockingHttpClient();
}

class _BlockingHttpClient implements HttpClient {
  static Never _blocked() => throw StateError(
        'Tests must not make real network requests. '
        'Mock the network client (Dio/http) instead.',
      );

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) => _blocked();

  @override
  Future<HttpClientRequest> open(
    String method,
    String host,
    int port,
    String path,
  ) =>
      _blocked();

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
