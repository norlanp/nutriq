import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityNotifier extends Notifier<bool> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  bool build() {
    _initConnectivity();
    ref.onDispose(() => _subscription?.cancel());
    return true;
  }

  Future<void> _initConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    state = result.any((r) => r != ConnectivityResult.none);

    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      state = results.any((r) => r != ConnectivityResult.none);
    });
  }
}

final connectivityProvider = NotifierProvider<ConnectivityNotifier, bool>(
  ConnectivityNotifier.new,
);