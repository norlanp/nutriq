import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/settings/presentation/notifier/export_import_notifier.dart';
import 'package:nutriq/features/settings/presentation/notifier/export_import_state.dart';
import 'package:nutriq/generated/l10n.dart';

class ExportImportDialog extends ConsumerWidget {
  const ExportImportDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exportImportNotifierProvider);
    return AlertDialog(
      title: Text(S.of(context).exportImportLabel,
          overflow: TextOverflow.ellipsis, maxLines: 2),
      content: Wrap(children: [
        Column(
          children: [
            if (state.status == ExportImportStatus.initial)
              Text(
                S.of(context).exportImportDescription,
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
              )
            else if (state.status == ExportImportStatus.loading)
              const LinearProgressIndicator()
            else if (state.status == ExportImportStatus.success)
              Builder(builder: (context) {
                _refreshScreens(ref);
                return Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary),
                    SizedBox(width: 8),
                    Text(
                      S.of(context).exportImportSuccessLabel,
                    ),
                  ],
                );
              }) else if (state.status == ExportImportStatus.error)
              Row(
                children: [
                  Icon(Icons.error, color: Theme.of(context).colorScheme.error),
                  SizedBox(width: 8),
                  Text(
                    S.of(context).exportImportErrorLabel,
                  ),
                ],
              ),
          ],
        ),
      ]),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            ref.read(exportImportNotifierProvider.notifier).exportData();
          },
          child: Text(S.of(context).exportAction),
        ),
        TextButton(
          onPressed: () {
            ref.read(exportImportNotifierProvider.notifier).importData();
          },
          child: Text(S.of(context).importAction),
        ),
      ],
    );
  }

  void _refreshScreens(WidgetRef ref) {
    ref.read(homeNotifierProvider.notifier).loadItems();
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();
  }
}