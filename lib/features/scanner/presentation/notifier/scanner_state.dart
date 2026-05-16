import 'package:equatable/equatable.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

enum ScannerFailedStateType { productNotFound, error }

class ScannerState extends Equatable {
  final MealEntity? product;
  final bool usesImperialUnits;
  final bool isLoading;
  final ScannerFailedStateType? errorType;

  const ScannerState({
    this.product,
    this.usesImperialUnits = false,
    this.isLoading = false,
    this.errorType,
  });

  bool get hasError => errorType != null;
  bool get isLoaded => product != null && !isLoading && !hasError;

  ScannerState copyWith({
    MealEntity? product,
    bool? usesImperialUnits,
    bool? isLoading,
    ScannerFailedStateType? errorType,
  }) {
    return ScannerState(
      product: product ?? this.product,
      usesImperialUnits: usesImperialUnits ?? this.usesImperialUnits,
      isLoading: isLoading ?? this.isLoading,
      errorType: errorType ?? this.errorType,
    );
  }

  ScannerState clearError() {
    return ScannerState(
      product: product,
      usesImperialUnits: usesImperialUnits,
      isLoading: isLoading,
      errorType: null,
    );
  }

  @override
  List<Object?> get props => [product, usesImperialUnits, isLoading, errorType];
}