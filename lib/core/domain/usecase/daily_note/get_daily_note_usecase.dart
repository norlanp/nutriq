import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/core/domain/repository/daily_note_repository.dart';

class GetDailyNoteUsecase {
  final DailyNoteRepository _dailyNoteRepository;

  GetDailyNoteUsecase(this._dailyNoteRepository);

  Future<DailyNoteEntity?> call(int userId, DateTime date) =>
      _dailyNoteRepository.getDailyNote(userId, date);
}
