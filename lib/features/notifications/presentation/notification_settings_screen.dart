import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/notifications/presentation/notification_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
      create: (_) =>
          locator<NotificationBloc>()..add(const LoadNotificationSettings(0)),
      child: const _NotificationSettingsView(),
    );
  }
}

class _NotificationSettingsView extends StatelessWidget {
  const _NotificationSettingsView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationSettingsLabel),
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state is NotificationSettingsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is NotificationSettingsInitial ||
              state is NotificationSettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NotificationSettingsLoaded) {
            return _SettingsForm(settings: state.settings);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _SettingsForm extends StatelessWidget {
  final NotificationSettingsEntity settings;

  const _SettingsForm({required this.settings});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          l10n.mealRemindersLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8.0),
        ...IntakeTypeEntity.values.map(
          (type) => _MealReminderTile(
            key: ValueKey(type),
            intakeType: type,
            minutes: settings.mealReminderMinutes[type],
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          l10n.dailySummaryLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8.0),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.enableDailySummaryLabel),
          value: settings.dailySummaryEnabled,
          onChanged: (enabled) {
            context.read<NotificationBloc>().add(
                  ToggleDailySummary(settings.userId, enabled),
                );
          },
        ),
        if (settings.dailySummaryEnabled)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.summaryTimeLabel),
            trailing: Text(
              _formatMinutes(settings.dailySummaryMinutes),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _pickSummaryTime(context, settings),
          ),
        const SizedBox(height: 32.0),
        FilledButton(
          onPressed: () {
            final currentState = context.read<NotificationBloc>().state;
            if (currentState is NotificationSettingsLoaded) {
              context.read<NotificationBloc>().add(
                    SaveNotificationSettings(currentState.settings),
                  );
            }
          },
          child: Text(l10n.buttonSaveLabel),
        ),
      ],
    );
  }

  String _formatMinutes(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  Future<void> _pickSummaryTime(
    BuildContext context,
    NotificationSettingsEntity settings,
  ) async {
    final currentHour = settings.dailySummaryMinutes ~/ 60;
    final currentMinute = settings.dailySummaryMinutes % 60;

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: currentHour, minute: currentMinute),
    );

    if (picked != null) {
      final totalMinutes = picked.hour * 60 + picked.minute;
      final updatedSettings = NotificationSettingsEntity(
        id: settings.id,
        userId: settings.userId,
        mealReminderMinutes: settings.mealReminderMinutes,
        dailySummaryEnabled: settings.dailySummaryEnabled,
        dailySummaryMinutes: totalMinutes,
      );
      context.read<NotificationBloc>().add(
            SaveNotificationSettings(updatedSettings),
          );
    }
  }
}

class _MealReminderTile extends StatelessWidget {
  final IntakeTypeEntity intakeType;
  final int? minutes;

  const _MealReminderTile({
    super.key,
    required this.intakeType,
    this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final label = _mealLabel(l10n, intakeType);
    final icon = intakeType.getIconData();

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label),
      trailing: Text(
        minutes != null ? _formatMinutes(minutes!) : l10n.notSetLabel,
        style: TextStyle(
          color: minutes != null
              ? null
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ),
      onTap: () => _pickTime(context),
    );
  }

  String _formatMinutes(int mins) {
    final hour = mins ~/ 60;
    final minute = mins % 60;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String _mealLabel(S l10n, IntakeTypeEntity type) {
    switch (type) {
      case IntakeTypeEntity.breakfast:
        return l10n.breakfastLabel;
      case IntakeTypeEntity.lunch:
        return l10n.lunchLabel;
      case IntakeTypeEntity.dinner:
        return l10n.dinnerLabel;
      case IntakeTypeEntity.snack:
        return l10n.snackLabel;
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final initialHour = minutes != null ? minutes! ~/ 60 : 8;
    final initialMinute = minutes != null ? minutes! % 60 : 0;

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialHour, minute: initialMinute),
    );

    if (picked != null) {
      final totalMinutes = picked.hour * 60 + picked.minute;
      final currentSettings =
          (context.read<NotificationBloc>().state as NotificationSettingsLoaded)
              .settings;
      context.read<NotificationBloc>().add(
            UpdateMealReminderTime(
              currentSettings.userId,
              intakeType,
              totalMinutes,
            ),
          );
    }
  }
}
