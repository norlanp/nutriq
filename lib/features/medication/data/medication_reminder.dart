import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/features/notifications/data/notification_scheduler.dart';

/// Schedules local notifications for medication reminders.
/// Reuses the existing [NotificationScheduler] infrastructure.
class MedicationReminder {
  static const maxReminderSlots = 10;

  final NotificationScheduler? _scheduler;

  MedicationReminder(this._scheduler);

  /// Schedules reminders for a medication at the given hours.
  /// Notification IDs are derived from [medication.id] to avoid collisions.
  Future<void> scheduleMedicationReminder(
    MedicationEntity medication,
    List<int> hours,
  ) async {
    if (kIsWeb || _scheduler == null) return;
    if (medication.id <= 0) {
      throw ArgumentError.value(
        medication.id,
        'medication.id',
        'Must be positive',
      );
    }
    if (hours.length > maxReminderSlots) {
      throw ArgumentError.value(
        hours,
        'hours',
        'Supports at most $maxReminderSlots reminders',
      );
    }
    if (hours.any((hour) => hour < 0 || hour > 23)) {
      throw ArgumentError.value(
        hours,
        'hours',
        'Hours must be between 0 and 23',
      );
    }

    await cancelMedicationReminder(medication);
    for (var slot = 0; slot < hours.length; slot++) {
      await _scheduler.scheduleMedicationReminder(
        notificationId: notificationIdFor(medication.id, slot),
        medicationName: medication.name,
        hour: hours[slot],
      );
    }
  }

  /// Cancels all scheduled reminders for a medication.
  Future<void> cancelMedicationReminder(MedicationEntity medication) async {
    if (kIsWeb || _scheduler == null) return;
    if (medication.id <= 0) {
      throw ArgumentError.value(
        medication.id,
        'medication.id',
        'Must be positive',
      );
    }
    for (var slot = 0; slot < maxReminderSlots; slot++) {
      await _scheduler.cancelMedicationReminder(
        notificationIdFor(medication.id, slot),
      );
    }
  }

  static int notificationIdFor(int medicationId, int slot) {
    if (medicationId <= 0) {
      throw ArgumentError.value(
        medicationId,
        'medicationId',
        'Must be positive',
      );
    }
    if (slot < 0 || slot >= maxReminderSlots) {
      throw ArgumentError.value(slot, 'slot', 'Must be between 0 and 9');
    }
    return -(medicationId * maxReminderSlots + slot + 1);
  }
}
