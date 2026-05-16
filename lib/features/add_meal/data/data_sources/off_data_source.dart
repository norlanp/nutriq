import 'package:logging/logging.dart';
import 'package:nutriq/core/network/off_api_client.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_response_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_word_response_dto.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class OFFDataSource {
  final OFFApiClient _apiClient;
  final log = Logger('OFFDataSource');

  OFFDataSource(this._apiClient);

  Future<OFFWordResponseDTO> fetchSearchWordResults(String searchString) async {
    try {
      log.fine('Fetching OFF results for: $searchString');
      final result = await _apiClient.searchProducts(searchString);
      log.fine('Successful response from OFF');
      return result;
    } catch (exception, stacktrace) {
      log.severe('Exception while getting OFF word search $exception');
      Sentry.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }

  Future<OFFProductResponseDTO> fetchBarcodeResults(String barcode) async {
    try {
      log.fine('Fetching OFF barcode result for: $barcode');
      final result = await _apiClient.getProductByBarcode(barcode);
      log.fine('Successful response from OFF');
      return result;
    } on ProductNotFoundException {
      rethrow;
    } catch (exception, stacktrace) {
      log.severe('Exception while getting OFF barcode search $exception');
      Sentry.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }
}