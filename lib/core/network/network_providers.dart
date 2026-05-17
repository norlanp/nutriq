import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/network/dio_provider.dart';
import 'package:nutriq/core/network/fdc_api_client.dart';

final fdcApiClientProvider = Provider<FDCApiClient>((ref) {
  return FDCApiClient(ref.watch(dioProvider));
});