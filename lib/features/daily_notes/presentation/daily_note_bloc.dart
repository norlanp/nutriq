import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/core/domain/usecase/daily_note/get_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/save_daily_note_usecase.dart';

part 'daily_note_event.dart';
part 'daily_note_state.dart';

class DailyNoteBloc extends Bloc<DailyNoteEvent, DailyNoteState> {
  final GetDailyNoteUsecase _getDailyNoteUsecase;
  final SaveDailyNoteUsecase _saveDailyNoteUsecase;

  DailyNoteBloc(
    this._getDailyNoteUsecase,
    this._saveDailyNoteUsecase,
  ) : super(DailyNoteInitial()) {
    on<LoadNote>(_onLoadNote);
    on<SaveNote>(_onSaveNote);
  }

  Future<void> _onLoadNote(LoadNote event, Emitter<DailyNoteState> emit) async {
    emit(DailyNoteLoading());
    try {
      final note = await _getDailyNoteUsecase(event.userId, event.date);
      emit(DailyNoteLoaded(note: note));
    } catch (e) {
      emit(DailyNoteError(e.toString()));
    }
  }

  Future<void> _onSaveNote(SaveNote event, Emitter<DailyNoteState> emit) async {
    try {
      await _saveDailyNoteUsecase(event.entity);
      emit(DailyNoteSaved());
      final note =
          await _getDailyNoteUsecase(event.entity.userId, event.entity.date);
      emit(DailyNoteLoaded(note: note));
    } catch (e) {
      emit(DailyNoteError(e.toString()));
    }
  }
}
