import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/settings/presentation/bloc/export_import_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class ExportImportDialog extends ConsumerWidget {
  const ExportImportDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportImportBloc = ref.read(exportImportBlocProvider);
    return AlertDialog(
      title: Text(S.of(context).exportImportLabel,
          overflow: TextOverflow.ellipsis, maxLines: 2),
      content: Wrap(children: [
        Column(
          children: [
            BlocBuilder<ExportImportBloc, ExportImportState>(
                bloc: exportImportBloc,
                builder: (context, state) {
                  if (state is ExportImportInitial) {
                    return Text(
                      S.of(context).exportImportDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 15,
                    );
                  } else if (state is ExportImportLoadingState) {
                    return const LinearProgressIndicator();
                  } else if (state is ExportImportSuccess) {
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
                  } else if (state is ExportImportError) {
                    return Row(
                      children: [
                        Icon(Icons.error,
                            color: Theme.of(context).colorScheme.error),
                        SizedBox(width: 8),
                        Text(
                          S.of(context).exportImportErrorLabel,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }),
          ],
        ),
      ]),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            exportImportBloc.add(ExportDataEvent());
          },
          child: Text(S.of(context).exportAction),
        ),
        TextButton(
          onPressed: () {
            exportImportBloc.add(ImportDataEvent());
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