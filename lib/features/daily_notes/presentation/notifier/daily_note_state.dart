import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';

class DailyNoteState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final DailyNoteEntity? note;
  final bool saved;

  const DailyNoteState({
    this.isLoading = false,
    this.errorMessage,
    this.note,
    this.saved = false,
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, note, saved];
}