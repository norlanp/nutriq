import 'package:equatable/equatable.dart';

class SymptomEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final DateTime timestamp;
  final String type;
  final int severity;
  final String? notes;

  const SymptomEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.type,
    required this.severity,
    this.notes,
  });

  @override
  List<Object?> get props =>
      [id, userId, date, timestamp, type, severity, notes];
}
