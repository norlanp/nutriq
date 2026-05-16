import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/add_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/delete_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/get_body_measurements_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final addBodyMeasurementUsecaseProvider = Provider((ref) {
  return AddBodyMeasurementUsecase(ref.watch(bodyMeasurementRepositoryProvider));
});

final getBodyMeasurementsUsecaseProvider = Provider((ref) {
  return GetBodyMeasurementsUsecase(
      ref.watch(bodyMeasurementRepositoryProvider));
});

final deleteBodyMeasurementUsecaseProvider = Provider((ref) {
  return DeleteBodyMeasurementUsecase(
      ref.watch(bodyMeasurementRepositoryProvider));
});