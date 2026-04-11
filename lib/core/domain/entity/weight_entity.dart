import 'package:equatable/equatable.dart';

class WeightEntity extends Equatable {
  final int id;
  final int userId;
  final double weightKg;
  final DateTime date;
  final String? note;

  const WeightEntity({
    required this.id,
    required this.userId,
    required this.weightKg,
    required this.date,
    this.note,
  });

  @override
  List<Object?> get props => [id, userId, weightKg, date, note];
}
