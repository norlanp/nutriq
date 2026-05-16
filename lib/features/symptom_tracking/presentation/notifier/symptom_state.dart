import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';

class SymptomState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<SymptomEntity> symptoms;

  const SymptomState({
    this.isLoading = false,
    this.errorMessage,
    this.symptoms = const [],
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, symptoms];
}