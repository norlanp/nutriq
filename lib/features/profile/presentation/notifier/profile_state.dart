import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/bmr_calculation_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_bmi_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';

class ProfileState extends Equatable {
  final UserBMIEntity userBMI;
  final UserEntity userEntity;
  final bool usesImperialUnits;
  final BMRCalculationEntity bmrCalculation;
  final TDEEMethodEntity tdeeMethod;

  const ProfileState({
    required this.userBMI,
    required this.userEntity,
    required this.usesImperialUnits,
    required this.bmrCalculation,
    required this.tdeeMethod,
  });

  @override
  List<Object?> get props => [
        userBMI,
        userEntity,
        usesImperialUnits,
        bmrCalculation,
        tdeeMethod,
      ];
}