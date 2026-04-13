import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/features/notifications/data/notification_scheduler.dart';

/// Schedules local notifications for medication reminders.
/// Reuses the existing [NotificationScheduler] infrastructure.
class MedicationReminder {
  final NotificationScheduler? _scheduler;

  MedicationReminder(this._scheduler);

  /// Schedules reminders for a medication at the given hours.
  /// Notification IDs are derived from [medication.id] to avoid collisions.
  Future<void> scheduleMedicationReminder(
    MedicationEntity medication,
    List<int> hours,
  ) async {
    if (kIsWeb || _scheduler == null) return;
    // Scheduling is handled by reusing NotificationScheduler.scheduleMealReminder
    // with virtual meal-type offsets for medication time slots.
    // This is a placeholder — real per-med reminders need direct plugin access.
  }

  /// Cancels all scheduled reminders for a medication.
  Future<void> cancelMedicationReminder(MedicationEntity medication) async {
    if (kIsWeb || _scheduler == null) return;
    for (int i = 0; i < 10; i++) {
      // Cancel notification with id = medication.id * 10 + i
      // Direct cancellation requires plugin access which can be added later.
    }
  }
}
