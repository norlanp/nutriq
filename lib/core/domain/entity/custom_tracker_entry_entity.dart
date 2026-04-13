import 'package:equatable/equatable.dart';

class CustomTrackerEntryEntity extends Equatable {
  final int id;
  final int userId;
  final int trackerId;
  final DateTime date;
  final double value;
  final String? textValue;

  const CustomTrackerEntryEntity({
    required this.id,
    required this.userId,
    required this.trackerId,
    required this.date,
    required this.value,
    this.textValue,
  });

  @override
  List<Object?> get props => [id, userId, trackerId, date, value, textValue];
}
