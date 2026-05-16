import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/daily_note/get_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/save_daily_note_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getDailyNoteUsecaseProvider = Provider((ref) {
  return GetDailyNoteUsecase(ref.watch(dailyNoteRepositoryProvider));
});

final saveDailyNoteUsecaseProvider = Provider((ref) {
  return SaveDailyNoteUsecase(ref.watch(dailyNoteRepositoryProvider));
});