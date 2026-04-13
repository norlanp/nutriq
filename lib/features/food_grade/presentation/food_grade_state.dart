part of 'food_grade_bloc.dart';

abstract class FoodGradeState extends Equatable {
  const FoodGradeState();

  @override
  List<Object?> get props => [];
}

class FoodGradeInitial extends FoodGradeState {}

class FoodGradeCalculated extends FoodGradeState {
  final FoodGrade grade;
  final int score;

  const FoodGradeCalculated({required this.grade, required this.score});

  @override
  List<Object?> get props => [grade, score];
}

class FoodGradeFiltered extends FoodGradeState {
  final List<dynamic> filteredItems;

  const FoodGradeFiltered({required this.filteredItems});

  @override
  List<Object?> get props => [filteredItems];
}

class FoodGradeError extends FoodGradeState {
  final String message;

  const FoodGradeError(this.message);

  @override
  List<Object?> get props => [message];
}
