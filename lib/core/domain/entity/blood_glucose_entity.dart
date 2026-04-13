import 'package:equatable/equatable.dart';

enum BloodGlucoseLabelType {
  fasting,
  beforeMeal,
  afterMeal,
  bedtime,
}

class BloodGlucoseEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final DateTime timestamp;
  final int valueMgDl;
  final BloodGlucoseLabelType label;
  final String? notes;

  const BloodGlucoseEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.valueMgDl,
    required this.label,
    this.notes,
  });

  @override
  List<Object?> get props =>
      [id, userId, date, timestamp, valueMgDl, label, notes];
}
