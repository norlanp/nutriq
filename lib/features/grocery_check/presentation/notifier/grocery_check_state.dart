import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';

enum GroceryCheckStatus {
  initial,
  loading,
  loaded,
  comparison,
  error,
}

class GroceryCheckState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final GroceryCheckStatus status;
  final List<GroceryCheckItem> items;
  final int? comparisonFirstIndex;
  final int? comparisonSecondIndex;

  const GroceryCheckState({
    this.isLoading = false,
    this.errorMessage,
    this.status = GroceryCheckStatus.initial,
    this.items = const [],
    this.comparisonFirstIndex,
    this.comparisonSecondIndex,
  });

  bool get hasError => errorMessage != null;

  GroceryCheckState copyWith({
    bool? isLoading,
    String? errorMessage,
    GroceryCheckStatus? status,
    List<GroceryCheckItem>? items,
    int? comparisonFirstIndex,
    int? comparisonSecondIndex,
  }) {
    return GroceryCheckState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      status: status ?? this.status,
      items: items ?? this.items,
      comparisonFirstIndex: comparisonFirstIndex,
      comparisonSecondIndex: comparisonSecondIndex,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        status,
        items,
        comparisonFirstIndex,
        comparisonSecondIndex,
      ];
}