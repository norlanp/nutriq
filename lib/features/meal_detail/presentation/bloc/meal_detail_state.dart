part of 'meal_detail_bloc.dart';

abstract class MealDetailState extends Equatable {
  final String totalQuantityConverted;
  final double totalKcal;
  final double totalCarbs;
  final double totalNetCarbs;
  final double totalFat;
  final double totalProtein;

  final String selectedUnit;

  const MealDetailState(
      {required this.totalQuantityConverted,
      this.totalKcal = 0,
      this.totalCarbs = 0,
      this.totalNetCarbs = 0,
      this.totalFat = 0,
      this.totalProtein = 0,
      required this.selectedUnit});

  @override
  List<Object> get props => [
        totalQuantityConverted,
        totalKcal,
        totalCarbs,
        totalNetCarbs,
        totalFat,
        totalProtein,
        selectedUnit
      ];

  MealDetailInitial copyWith({
    String? totalQuantityConverted,
    double? totalKcal,
    double? totalCarbs,
    double? totalNetCarbs,
    double? totalFat,
    double? totalProtein,
    String? selectedUnit,
  }) {
    return MealDetailInitial(
      totalQuantityConverted:
          totalQuantityConverted ?? this.totalQuantityConverted,
      totalKcal: totalKcal ?? this.totalKcal,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalNetCarbs: totalNetCarbs ?? this.totalNetCarbs,
      totalFat: totalFat ?? this.totalFat,
      totalProtein: totalProtein ?? this.totalProtein,
      selectedUnit: selectedUnit ?? this.selectedUnit,
    );
  }
}

class MealDetailInitial extends MealDetailState {
  const MealDetailInitial(
      {required super.totalQuantityConverted,
      super.totalKcal,
      super.totalCarbs,
      super.totalNetCarbs,
      super.totalFat,
      super.totalProtein,
      required super.selectedUnit});
}
