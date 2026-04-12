import 'package:equatable/equatable.dart';

class BodyMeasurementEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final double? waistCm;
  final double? neckCm;
  final double? hipCm;
  final double? chestCm;
  final double? bicepCm;
  final double? thighCm;
  final String? note;

  const BodyMeasurementEntity({
    required this.id,
    required this.userId,
    required this.date,
    this.waistCm,
    this.neckCm,
    this.hipCm,
    this.chestCm,
    this.bicepCm,
    this.thighCm,
    this.note,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        date,
        waistCm,
        neckCm,
        hipCm,
        chestCm,
        bicepCm,
        thighCm,
        note
      ];
}
