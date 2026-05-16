import 'package:formz/formz.dart';

enum MacroInputError {
  empty,
  invalidFormat,
  negative,
  tooLarge,
}

class MacroInput extends FormzInput<String, MacroInputError> {
  const MacroInput.pure() : super.pure('');
  const MacroInput.dirty([super.value = '']) : super.dirty();

  static const double _max = 100;

  @override
  MacroInputError? validator(String value) {
    if (value.isEmpty) return null;
    final parsed = double.tryParse(value);
    if (parsed == null) return MacroInputError.invalidFormat;
    if (parsed < 0) return MacroInputError.negative;
    if (parsed > _max) return MacroInputError.tooLarge;
    return null;
  }

  double? toDouble() {
    if (value.isEmpty) return null;
    return double.tryParse(value);
  }
}