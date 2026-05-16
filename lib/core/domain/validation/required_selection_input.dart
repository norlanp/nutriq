import 'package:formz/formz.dart';

enum RequiredSelectionInputError { empty }

class RequiredSelectionInput<V> extends FormzInput<V?, RequiredSelectionInputError> {
  const RequiredSelectionInput.pure() : super.pure(null);
  const RequiredSelectionInput.dirty(V? super.value) : super.dirty();

  @override
  RequiredSelectionInputError? validator(V? value) {
    if (value == null) return RequiredSelectionInputError.empty;
    return null;
  }
}