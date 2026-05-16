import 'package:formz/formz.dart';

enum BooleanInputError { notTrue }

class BooleanInput extends FormzInput<bool, BooleanInputError> {
  const BooleanInput.pure() : super.pure(false);
  const BooleanInput.dirty([super.value = false]) : super.dirty();

  @override
  BooleanInputError? validator(bool value) {
    if (!value) return BooleanInputError.notTrue;
    return null;
  }
}