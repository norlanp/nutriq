import 'package:formz/formz.dart';

enum RequiredDateInputError { empty, future }

class RequiredDateInput extends FormzInput<DateTime?, RequiredDateInputError> {
  const RequiredDateInput.pure() : super.pure(null);
  const RequiredDateInput.dirty([super.value]) : super.dirty();

  @override
  RequiredDateInputError? validator(DateTime? value) {
    if (value == null) return RequiredDateInputError.empty;
    if (value.isAfter(DateTime.now())) return RequiredDateInputError.future;
    return null;
  }
}