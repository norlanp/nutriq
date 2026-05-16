import 'package:equatable/equatable.dart';

class AddMealState extends Equatable {
  final bool usesImperialUnits;

  const AddMealState({this.usesImperialUnits = false});

  @override
  List<Object?> get props => [usesImperialUnits];
}