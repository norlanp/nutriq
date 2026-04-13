import 'package:equatable/equatable.dart';

class DailyNoteEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final String note;

  const DailyNoteEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.note,
  });

  @override
  List<Object?> get props => [id, userId, date, note];
}
