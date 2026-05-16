import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/features/daily_notes/presentation/notifier/daily_note_notifier.dart';
import 'package:nutriq/features/daily_notes/presentation/notifier/daily_note_state.dart';
import 'package:nutriq/generated/l10n.dart';

class DailyNoteScreen extends ConsumerStatefulWidget {
  final DateTime date;
  final int userId;

  const DailyNoteScreen({
    super.key,
    required this.date,
    this.userId = 0,
  });

  @override
  ConsumerState<DailyNoteScreen> createState() => _DailyNoteScreenState();
}

class _DailyNoteScreenState extends ConsumerState<DailyNoteScreen> {
  late TextEditingController _noteController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    ref.read(dailyNoteNotifierProvider.notifier).loadNote(widget.userId, widget.date);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _noteController.dispose();
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
      ref.read(dailyNoteNotifierProvider.notifier).saveNote(entity);
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dailyNoteNotifierProvider);

    ref.listen<DailyNoteState>(dailyNoteNotifierProvider, (prev, next) {
      if (next.saved && !(prev?.saved ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).dailyNoteSaved),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).dailyNoteLabel),
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, DailyNoteState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (state.note != null &&
        state.note!.note.isNotEmpty &&
        _noteController.text.isEmpty) {
      _noteController.text = state.note!.note;
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
  }
}