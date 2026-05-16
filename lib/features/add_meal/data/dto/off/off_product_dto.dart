// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:nutriq/core/utils/extensions.dart';
import 'package:nutriq/core/utils/supported_language.dart';
import 'package:nutriq/features/add_meal/data/dto/off/json_converters.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_nutriments_dto.dart';

part 'off_product_dto.g.dart';

class DynamicQuantityToDoubleConverter
    implements JsonConverter<double?, dynamic> {
  const DynamicQuantityToDoubleConverter();

  @override
  double? fromJson(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final cleaned = value.replaceAll(RegExp(r'mg|g|kg|ml|cl|l| '), '');
      return double.tryParse(cleaned) ?? int.tryParse(cleaned)?.toDouble();
    }
    return null;
  }

  @override
  dynamic toJson(double? value) => value;
}

@JsonSerializable()
class OFFProductDTO {
  final String? code;
  final String? product_name;
  final String? product_name_en;
  final String? product_name_fr;
  final String? product_name_de;

  final String? brands;

  final String? image_front_thumb_url;
  final String? image_front_url;
  final String? image_ingredients_url;
  final String? image_nutrition_url;
  final String? image_url;

  final String? url;

  final String? quantity;

  @DynamicToStringConverter()
  final String? product_quantity;

  @DynamicQuantityToDoubleConverter()
  final double? serving_quantity;

  @JsonKey(name: 'serving_size')
  final String? serving_size;

  final OFFProductNutrimentsDTO nutriments;

  String? getLocaleName(SupportedLanguage supportedLanguage) {
    String? localeName;
    switch (supportedLanguage) {
      case SupportedLanguage.en:
        localeName = product_name_en;
        break;
      case SupportedLanguage.de:
        localeName = product_name_de;
        break;
    }

    // If local language is not available, return available language
    if (localeName == null || localeName.isEmpty) {
      localeName =
          product_name ?? product_name_en ?? product_name_fr ?? product_name_de;
    }
    return localeName;
  }

  OFFProductDTO(
      {required this.code,
      required this.product_name,
      required this.product_name_en,
      required this.product_name_fr,
      required this.product_name_de,
      required this.brands,
      required this.image_front_thumb_url,
      required this.image_front_url,
      required this.image_ingredients_url,
      required this.image_nutrition_url,
      required this.image_url,
      required this.url,
      required this.quantity,
      required this.product_quantity,
      required this.serving_quantity,
      required this.serving_size,
      required this.nutriments});

  factory OFFProductDTO.fromJson(Map<String, dynamic> json) =>
      _$OFFProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OFFProductDTOToJson(this);
}
