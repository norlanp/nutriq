part of 'daily_note_bloc.dart';

abstract class DailyNoteState extends Equatable {
  const DailyNoteState();

  @override
  List<Object?> get props => [];
}

class DailyNoteInitial extends DailyNoteState {}

class DailyNoteLoading extends DailyNoteState {}

class DailyNoteLoaded extends DailyNoteState {
  final DailyNoteEntity? note;

  const DailyNoteLoaded({this.note});

  @override
  List<Object?> get props => [note];
}

class DailyNoteSaved extends DailyNoteState {}

class DailyNoteError extends DailyNoteState {
  final String message;

  const DailyNoteError(this.message);

  @override
  List<Object?> get props => [message];
}
