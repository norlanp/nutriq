import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';

class FoodGradeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final FoodGrade? grade;
  final int? score;
  final List<dynamic> filteredItems;

  const FoodGradeState({
    this.isLoading = false,
    this.errorMessage,
    this.grade,
    this.score,
    this.filteredItems = const [],
  });

  bool get hasError => errorMessage != null;

  FoodGradeState copyWith({
    bool? isLoading,
    String? errorMessage,
    FoodGrade? grade,
    int? score,
    List<dynamic>? filteredItems,
  }) {
    return FoodGradeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      grade: grade,
      score: score,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, grade, score, filteredItems];
}