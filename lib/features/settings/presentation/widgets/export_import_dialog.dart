import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/diary/presentation/bloc/calendar_day_bloc.dart';
import 'package:nutriq/features/diary/presentation/bloc/diary_bloc.dart';
import 'package:nutriq/features/home/presentation/bloc/home_bloc.dart';
import 'package:nutriq/features/settings/presentation/bloc/export_import_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class ExportImportDialog extends ConsumerWidget {
  const ExportImportDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportImportBloc = ref.read(exportImportBlocProvider);
    final homeBloc = ref.read(homeBlocProvider);
    final diaryBloc = ref.read(diaryBlocProvider);
    final calendarDayBloc = ref.read(calendarDayBlocProvider);
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
                    _refreshScreens(homeBloc, diaryBloc, calendarDayBloc);
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

  void _refreshScreens(
      HomeBloc homeBloc, DiaryBloc diaryBloc, CalendarDayBloc calendarDayBloc) {
    homeBloc.add(const LoadItemsEvent());
    diaryBloc.add(const LoadDiaryYearEvent());
    calendarDayBloc.add(RefreshCalendarDayEvent());
  }
}
