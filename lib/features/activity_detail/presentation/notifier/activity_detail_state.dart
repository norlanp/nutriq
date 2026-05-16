import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';

class ActivityDetailState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final double totalKcalBurned;
  final int quantityMin;
  final UserEntity? userEntity;
  final PhysicalActivityEntity? physicalActivity;
  final bool isLoaded;

  const ActivityDetailState({
    this.isLoading = false,
    this.errorMessage,
    this.totalKcalBurned = 0,
    this.quantityMin = 60,
    this.userEntity,
    this.physicalActivity,
    this.isLoaded = false,
  });

  bool get hasError => errorMessage != null;

  ActivityDetailState copyWith({
    bool? isLoading,
    String? errorMessage,
    double? totalKcalBurned,
    int? quantityMin,
    UserEntity? userEntity,
    PhysicalActivityEntity? physicalActivity,
    bool? isLoaded,
  }) {
    return ActivityDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      totalKcalBurned: totalKcalBurned ?? this.totalKcalBurned,
      quantityMin: quantityMin ?? this.quantityMin,
      userEntity: userEntity ?? this.userEntity,
      physicalActivity: physicalActivity ?? this.physicalActivity,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, totalKcalBurned, quantityMin, userEntity, physicalActivity, isLoaded];
}