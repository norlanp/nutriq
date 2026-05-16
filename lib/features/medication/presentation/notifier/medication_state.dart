import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';

class MedicationState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<MedicationEntity> medications;
  final List<MedicationLogEntity> logs;

  const MedicationState({
    this.isLoading = false,
    this.errorMessage,
    this.medications = const [],
    this.logs = const [],
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, medications, logs];
}