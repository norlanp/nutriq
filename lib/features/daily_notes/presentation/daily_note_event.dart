part of 'daily_note_bloc.dart';

abstract class DailyNoteEvent extends Equatable {
  const DailyNoteEvent();

  @override
  List<Object?> get props => [];
}

class LoadNote extends DailyNoteEvent {
  final int userId;
  final DateTime date;

  const LoadNote({required this.userId, required this.date});

  @override
  List<Object?> get props => [userId, date];
}

class SaveNote extends DailyNoteEvent {
  final DailyNoteEntity entity;

  const SaveNote({required this.entity});

  @override
  List<Object?> get props => [entity];
}
