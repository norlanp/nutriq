import 'package:logging/logging.dart';
import 'package:nutriq/core/network/fdc_api_client.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_word_response_dto.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FDCDataSource {
  final FDCApiClient _apiClient;
  final log = Logger('FDCDataSource');

  FDCDataSource(this._apiClient);

  Future<FDCWordResponseDTO> fetchSearchWordResults(String searchString) async {
    try {
      log.fine('Fetching FDC results for: $searchString');
      final result = await _apiClient.searchFoods(searchString);
      log.fine('Successful response from FDC');
      return result;
    } catch (exception, stacktrace) {
      log.severe('Exception while getting FDC word search $exception');
      Sentry.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }
}