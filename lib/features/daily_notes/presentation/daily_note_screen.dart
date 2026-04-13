import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/daily_notes/presentation/daily_note_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class DailyNoteScreen extends StatefulWidget {
  final DateTime date;
  final int userId;

  const DailyNoteScreen({
    super.key,
    required this.date,
    this.userId = 0,
  });

  @override
  State<DailyNoteScreen> createState() => _DailyNoteScreenState();
}

class _DailyNoteScreenState extends State<DailyNoteScreen> {
  late DailyNoteBloc _dailyNoteBloc;
  late TextEditingController _noteController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _dailyNoteBloc = locator<DailyNoteBloc>();
    _noteController = TextEditingController();
    _dailyNoteBloc.add(LoadNote(userId: widget.userId, date: widget.date));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _noteController.dispose();
    _dailyNoteBloc.close();
    super.dispose();
  }

  void _onNoteChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      final entity = DailyNoteEntity(
        id: 0,
        userId: widget.userId,
        date: DateTime(widget.date.year, widget.date.month, widget.date.day),
        note: value,
      );
      _dailyNoteBloc.add(SaveNote(entity: entity));
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dailyNoteBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).dailyNoteLabel),
        ),
        body: BlocConsumer<DailyNoteBloc, DailyNoteState>(
          bloc: _dailyNoteBloc,
          listener: (context, state) {
            if (state is DailyNoteSaved) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).dailyNoteSaved),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DailyNoteLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DailyNoteError) {
              return Center(child: Text(state.message));
            }
            if (state is DailyNoteLoaded) {
              if (!_noteController.text.isNotEmpty &&
                  state.note != null &&
                  state.note!.note.isNotEmpty) {
                _noteController.text = state.note!.note;
              }
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _formatDate(widget.date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TextField(
                      controller: _noteController,
                      onChanged: _onNoteChanged,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: S.of(context).dailyNoteHint,
                        border: const OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
