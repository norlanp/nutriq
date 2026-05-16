import 'package:formz/formz.dart';

enum RequiredStringInputError { empty }

class RequiredStringInput
    extends FormzInput<String, RequiredStringInputError> {
  const RequiredStringInput.pure() : super.pure('');
  const RequiredStringInput.dirty([super.value = '']) : super.dirty();

  @override
  RequiredStringInputError? validator(String value) {
    if (value.trim().isEmpty) return RequiredStringInputError.empty;
    return null;
  }
}