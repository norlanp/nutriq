import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/features/notifications/presentation/notifier/notification_settings_notifier.dart';
import 'package:nutriq/features/notifications/presentation/notifier/notification_settings_state.dart';
import 'package:nutriq/generated/l10n.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends ConsumerState<NotificationSettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationSettingsNotifierProvider.notifier).loadSettings(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationSettingsNotifierProvider);

    ref.listen<NotificationSettingsState>(notificationSettingsNotifierProvider, (prev, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notificationSettingsLabel),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.isLoaded
              ? _SettingsForm(settings: state.settings!)
              : const SizedBox(),
    );
  }
}

class _SettingsForm extends ConsumerWidget {
  final NotificationSettingsEntity settings;

  const _SettingsForm({required this.settings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ref.read(notificationSettingsNotifierProvider.notifier)
                .toggleDailySummary(settings.userId, enabled);
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
            onTap: () => _pickSummaryTime(context, ref, settings),
          ),
        const SizedBox(height: 32.0),
        FilledButton(
          onPressed: () {
            ref.read(notificationSettingsNotifierProvider.notifier)
                .saveSettings(settings);
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
    WidgetRef ref,
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
      ref.read(notificationSettingsNotifierProvider.notifier)
          .saveSettings(updatedSettings);
    }
  }
}

class _MealReminderTile extends ConsumerWidget {
  final IntakeTypeEntity intakeType;
  final int? minutes;

  const _MealReminderTile({
    super.key,
    required this.intakeType,
    this.minutes,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onTap: () => _pickTime(context, ref),
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

  Future<void> _pickTime(BuildContext context, WidgetRef ref) async {
    final initialHour = minutes != null ? minutes! ~/ 60 : 8;
    final initialMinute = minutes != null ? minutes! % 60 : 0;

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialHour, minute: initialMinute),
    );

    if (picked != null) {
      final totalMinutes = picked.hour * 60 + picked.minute;
      final currentSettings = ref.read(notificationSettingsNotifierProvider).settings;
      if (currentSettings != null) {
        ref.read(notificationSettingsNotifierProvider.notifier)
            .updateMealReminderTime(currentSettings.userId, intakeType, totalMinutes);
      }
    }
  }
}