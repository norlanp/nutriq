import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/features/daily_note/providers/daily_note_providers.dart';
import 'package:nutriq/features/daily_notes/presentation/notifier/daily_note_state.dart';

class DailyNoteNotifier extends Notifier<DailyNoteState> {
  @override
  DailyNoteState build() => const DailyNoteState();

  Future<void> loadNote(int userId, DateTime date) async {
    state = const DailyNoteState(isLoading: true);
    try {
      final note = await ref
          .read(getDailyNoteUsecaseProvider)
          .call(userId, date);
      state = DailyNoteState(note: note);
    } catch (e) {
      state = DailyNoteState(errorMessage: e.toString());
    }
  }

  Future<void> saveNote(DailyNoteEntity entity) async {
    try {
      await ref.read(saveDailyNoteUsecaseProvider).call(entity);
      final note = await ref
          .read(getDailyNoteUsecaseProvider)
          .call(entity.userId, entity.date);
      state = DailyNoteState(note: note, saved: true);
    } catch (e) {
      state = DailyNoteState(note: state.note, errorMessage: e.toString());
    }
  }
}

final dailyNoteNotifierProvider =
    NotifierProvider<DailyNoteNotifier, DailyNoteState>(
        DailyNoteNotifier.new);