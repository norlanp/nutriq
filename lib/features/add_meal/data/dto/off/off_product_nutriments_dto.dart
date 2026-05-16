// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:nutriq/features/add_meal/data/dto/off/json_converters.dart';

part 'off_product_nutriments_dto.g.dart';

@JsonSerializable()
class OFFProductNutrimentsDTO {
  @JsonKey(name: 'energy-kcal_100g')
  @DynamicToDoubleConverter()
  final double? energy_kcal_100g;

  @DynamicToDoubleConverter()
  final double? carbohydrates_100g;

  @DynamicToDoubleConverter()
  final double? fat_100g;

  @DynamicToDoubleConverter()
  final double? proteins_100g;

  @DynamicToDoubleConverter()
  final double? sugars_100g;

  @JsonKey(name: 'saturated-fat_100g')
  @DynamicToDoubleConverter()
  final double? saturated_fat_100g;

  @DynamicToDoubleConverter()
  final double? fiber_100g;

  @JsonKey(name: 'sodium_100g')
  @DynamicToDoubleConverter()
  final double? sodium_100g;

  @JsonKey(name: 'potassium_100g')
  @DynamicToDoubleConverter()
  final double? potassium_100g;

  @JsonKey(name: 'cholesterol_100g')
  @DynamicToDoubleConverter()
  final double? cholesterol_100g;

  @JsonKey(name: 'vitamin-a_100g')
  @DynamicToDoubleConverter()
  final double? vitamin_a_100g;

  @JsonKey(name: 'vitamin-c_100g')
  @DynamicToDoubleConverter()
  final double? vitamin_c_100g;

  @JsonKey(name: 'vitamin-d_100g')
  @DynamicToDoubleConverter()
  final double? vitamin_d_100g;

  @JsonKey(name: 'calcium_100g')
  @DynamicToDoubleConverter()
  final double? calcium_100g;

  @JsonKey(name: 'iron_100g')
  @DynamicToDoubleConverter()
  final double? iron_100g;

  OFFProductNutrimentsDTO({
    required this.energy_kcal_100g,
    required this.carbohydrates_100g,
    required this.fat_100g,
    required this.proteins_100g,
    required this.sugars_100g,
    required this.saturated_fat_100g,
    required this.fiber_100g,
    this.sodium_100g,
    this.potassium_100g,
    this.cholesterol_100g,
    this.vitamin_a_100g,
    this.vitamin_c_100g,
    this.vitamin_d_100g,
    this.calcium_100g,
    this.iron_100g,
  });

  factory OFFProductNutrimentsDTO.fromJson(Map<String, dynamic> json) =>
      _$OFFProductNutrimentsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OFFProductNutrimentsDTOToJson(this);
}