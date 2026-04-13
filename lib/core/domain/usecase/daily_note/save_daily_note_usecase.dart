import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/core/domain/repository/daily_note_repository.dart';

class SaveDailyNoteUsecase {
  final DailyNoteRepository _dailyNoteRepository;

  SaveDailyNoteUsecase(this._dailyNoteRepository);

  Future<void> call(DailyNoteEntity entity) =>
      _dailyNoteRepository.saveDailyNote(entity);
}
