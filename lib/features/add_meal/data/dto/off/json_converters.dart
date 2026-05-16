import 'package:json_annotation/json_annotation.dart';
import 'package:nutriq/core/utils/extensions.dart';

class DynamicToDoubleConverter implements JsonConverter<double?, dynamic> {
  const DynamicToDoubleConverter();

  @override
  double? fromJson(dynamic value) => (value as Object?).asDoubleOrNull();

  @override
  dynamic toJson(double? value) => value;
}

class DynamicToStringConverter implements JsonConverter<String?, dynamic> {
  const DynamicToStringConverter();

  @override
  String? fromJson(dynamic value) => value?.toString();

  @override
  dynamic toJson(String? value) => value;
}