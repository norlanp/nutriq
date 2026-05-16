import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/validation/macro_input.dart';
import 'package:nutriq/core/domain/validation/non_negative_double_input.dart';
import 'package:nutriq/core/domain/validation/required_string_input.dart';

class CustomFoodFormState {
  final RequiredStringInput name;
  final String brands;
  final NonNegativeDoubleInput kcal;
  final MacroInput carbs;
  final MacroInput fat;
  final MacroInput protein;
  final MacroInput sugars;
  final MacroInput saturatedFat;
  final MacroInput fiber;
  final NonNegativeDoubleInput sodium;

  const CustomFoodFormState({
    this.name = const RequiredStringInput.pure(),
    this.brands = '',
    this.kcal = const NonNegativeDoubleInput.pure(),
    this.carbs = const MacroInput.pure(),
    this.fat = const MacroInput.pure(),
    this.protein = const MacroInput.pure(),
    this.sugars = const MacroInput.pure(),
    this.saturatedFat = const MacroInput.pure(),
    this.fiber = const MacroInput.pure(),
    this.sodium = const NonNegativeDoubleInput.pure(),
  });

  bool get isValid => name.isValid;

  CustomFoodFormState copyWith({
    RequiredStringInput? name,
    String? brands,
    NonNegativeDoubleInput? kcal,
    MacroInput? carbs,
    MacroInput? fat,
    MacroInput? protein,
    MacroInput? sugars,
    MacroInput? saturatedFat,
    MacroInput? fiber,
    NonNegativeDoubleInput? sodium,
  }) {
    return CustomFoodFormState(
      name: name ?? this.name,
      brands: brands ?? this.brands,
      kcal: kcal ?? this.kcal,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      protein: protein ?? this.protein,
      sugars: sugars ?? this.sugars,
      saturatedFat: saturatedFat ?? this.saturatedFat,
      fiber: fiber ?? this.fiber,
      sodium: sodium ?? this.sodium,
    );
  }
}

class CustomFoodFormNotifier extends Notifier<CustomFoodFormState> {
  @override
  CustomFoodFormState build() => const CustomFoodFormState();

  void nameChanged(String value) {
    state = state.copyWith(name: RequiredStringInput.dirty(value));
  }

  void brandsChanged(String value) {
    state = state.copyWith(brands: value);
  }

  void kcalChanged(String value) {
    state = state.copyWith(kcal: NonNegativeDoubleInput.dirty(value));
  }

  void carbsChanged(String value) {
    state = state.copyWith(carbs: MacroInput.dirty(value));
  }

  void fatChanged(String value) {
    state = state.copyWith(fat: MacroInput.dirty(value));
  }

  void proteinChanged(String value) {
    state = state.copyWith(protein: MacroInput.dirty(value));
  }

  void sugarsChanged(String value) {
    state = state.copyWith(sugars: MacroInput.dirty(value));
  }

  void saturatedFatChanged(String value) {
    state = state.copyWith(saturatedFat: MacroInput.dirty(value));
  }

  void fiberChanged(String value) {
    state = state.copyWith(fiber: MacroInput.dirty(value));
  }

  void sodiumChanged(String value) {
    state = state.copyWith(sodium: NonNegativeDoubleInput.dirty(value));
  }
}

final customFoodFormProvider =
    NotifierProvider<CustomFoodFormNotifier, CustomFoodFormState>(
  CustomFoodFormNotifier.new,
);