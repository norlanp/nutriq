import 'package:equatable/equatable.dart';

class EditMealState extends Equatable {
  final bool usesImperialUnits;

  const EditMealState({this.usesImperialUnits = false});

  @override
  List<Object?> get props => [usesImperialUnits];
}