import 'package:formz/formz.dart';

enum NonNegativeDoubleInputError {
  empty,
  invalidFormat,
  negative,
}

class NonNegativeDoubleInput
    extends FormzInput<String, NonNegativeDoubleInputError> {
  const NonNegativeDoubleInput.pure() : super.pure('');
  const NonNegativeDoubleInput.dirty([super.value = '']) : super.dirty();

  @override
  NonNegativeDoubleInputError? validator(String value) {
    if (value.isEmpty) return null;
    final parsed = double.tryParse(value);
    if (parsed == null) return NonNegativeDoubleInputError.invalidFormat;
    if (parsed < 0) return NonNegativeDoubleInputError.negative;
    return null;
  }

  double? toDouble() {
    if (value.isEmpty) return null;
    return double.tryParse(value);
  }
}