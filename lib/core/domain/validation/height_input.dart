import 'package:formz/formz.dart';

enum HeightInputError {
  empty,
  invalidFormat,
  tooSmall,
  tooLarge,
}

class HeightInput extends FormzInput<String, HeightInputError> {
  final bool isImperial;

  const HeightInput.pure({this.isImperial = false}) : super.pure('');
  const HeightInput.dirty({required String value, this.isImperial = false})
      : super.dirty(value);

  static const double _minCm = 30;
  static const double _maxCm = 300;
  static const double _minFt = 1;
  static const double _maxFt = 10;

  @override
  HeightInputError? validator(String value) {
    if (value.isEmpty) return HeightInputError.empty;

    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) return HeightInputError.invalidFormat;

    if (isImperial) {
      if (parsed < _minFt) return HeightInputError.tooSmall;
      if (parsed > _maxFt) return HeightInputError.tooLarge;
    } else {
      if (parsed < _minCm) return HeightInputError.tooSmall;
      if (parsed > _maxCm) return HeightInputError.tooLarge;
    }
    return null;
  }

  double? toCm() {
    if (!isValid) return null;
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) return null;
    if (isImperial) {
      return parsed * 30.48;
    }
    return parsed;
  }
}