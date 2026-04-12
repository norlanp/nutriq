import 'package:equatable/equatable.dart';

class WaterEntity extends Equatable {
  final int id;
  final int userId;
  final int amountMl;
  final DateTime date;
  final DateTime timestamp;

  const WaterEntity({
    required this.id,
    required this.userId,
    required this.amountMl,
    required this.date,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, userId, amountMl, date, timestamp];
}
