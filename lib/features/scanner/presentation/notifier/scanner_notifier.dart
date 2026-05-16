import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';

import 'package:nutriq/features/scanner/presentation/notifier/scanner_state.dart';

class ScannerNotifier extends Notifier<ScannerState> {
  final _log = Logger('ScannerNotifier');

  @override
  ScannerState build() {
    return const ScannerState();
  }

  Future<void> loadProduct(String barcode) async {
    state = const ScannerState(isLoading: true);
    try {
      final result = await ref
          .read(searchProductByBarcodeUseCaseProvider)
          .searchProductByBarcode(barcode);
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      state = ScannerState(
          product: result, usesImperialUnits: config.usesImperialUnits);
    } on ProductNotFoundException {
      state = const ScannerState(errorType: ScannerFailedStateType.productNotFound);
    } catch (exception) {
      _log.severe(exception);
      state = const ScannerState(errorType: ScannerFailedStateType.error);
    }
  }
}

final scannerNotifierProvider =
    NotifierProvider<ScannerNotifier, ScannerState>(
  ScannerNotifier.new,
);