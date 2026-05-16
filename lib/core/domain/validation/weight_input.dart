import 'package:formz/formz.dart';

enum WeightInputError {
  empty,
  invalidFormat,
  tooSmall,
  tooLarge,
}

class WeightInput extends FormzInput<String, WeightInputError> {
  final bool isImperial;

  const WeightInput.pure({this.isImperial = false}) : super.pure('');
  const WeightInput.dirty({required String value, this.isImperial = false})
      : super.dirty(value);

  static const double _minKg = 10;
  static const double _maxKg = 500;
  static const double _minLbs = 22;
  static const double _maxLbs = 1100;

  @override
  WeightInputError? validator(String value) {
    if (value.isEmpty) return WeightInputError.empty;

    final parsed = double.tryParse(value);
    if (parsed == null) return WeightInputError.invalidFormat;

    if (isImperial) {
      if (parsed < _minLbs) return WeightInputError.tooSmall;
      if (parsed > _maxLbs) return WeightInputError.tooLarge;
    } else {
      if (parsed < _minKg) return WeightInputError.tooSmall;
      if (parsed > _maxKg) return WeightInputError.tooLarge;
    }
    return null;
  }

  double? toKg() {
    if (!isValid) return null;
    final parsed = double.tryParse(value);
    if (parsed == null) return null;
    if (isImperial) {
      return parsed / 2.20462;
    }
    return parsed;
  }
}