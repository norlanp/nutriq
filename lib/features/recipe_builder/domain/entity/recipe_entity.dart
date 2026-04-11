import 'package:equatable/equatable.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';

class RecipeEntity extends Equatable {
  final String id;
  final String name;
  final String servings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<RecipeItemEntity> items;

  const RecipeEntity({
    required this.id,
    required this.name,
    required this.servings,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  double get totalKcal => items.fold(0, (sum, item) => sum + item.totalKcal);
  double get totalCarbsGram =>
      items.fold(0, (sum, item) => sum + item.totalCarbsGram);
  double get totalFatsGram =>
      items.fold(0, (sum, item) => sum + item.totalFatsGram);
  double get totalProteinsGram =>
      items.fold(0, (sum, item) => sum + item.totalProteinsGram);

  @override
  List<Object?> get props => [id, name, servings, items];
}
