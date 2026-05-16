import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';

class BloodGlucoseState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<BloodGlucoseEntity> entries;
  final double? average;

  const BloodGlucoseState({
    this.isLoading = false,
    this.errorMessage,
    this.entries = const [],
    this.average,
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, entries, average];
}