import 'package:equatable/equatable.dart';

class FoodCandidateEntity extends Equatable {
  final String name;
  final double confidence;

  const FoodCandidateEntity({
    required this.name,
    required this.confidence,
  });

  @override
  List<Object?> get props => [name, confidence];
}
