import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/features/medication/data/medication_reminder.dart';
import 'package:nutriq/features/notifications/data/notification_scheduler.dart';

class MockNotificationScheduler extends Mock implements NotificationScheduler {}

void main() {
  late MockNotificationScheduler scheduler;
  late MedicationReminder reminder;

  setUp(() {
    scheduler = MockNotificationScheduler();
    reminder = MedicationReminder(scheduler);
    when(
      () => scheduler.cancelMedicationReminder(any()),
    ).thenAnswer((_) async {});
    when(
      () => scheduler.scheduleMedicationReminder(
        notificationId: any(named: 'notificationId'),
        medicationName: any(named: 'medicationName'),
        hour: any(named: 'hour'),
      ),
    ).thenAnswer((_) async {});
  });

  final medication = MedicationEntity(
    id: 42,
    userId: 1,
    name: 'Aspirin',
    dosage: '100 mg',
    frequency: MedicationFrequencyType.daily,
    timesPerDay: 2,
  );

  test(
    'uses stable distinct notification IDs for medication reminder slots',
    () {
      expect(MedicationReminder.notificationIdFor(42, 0), -421);
      expect(MedicationReminder.notificationIdFor(42, 1), -422);
      expect(
        MedicationReminder.notificationIdFor(43, 0),
        isNot(MedicationReminder.notificationIdFor(42, 9)),
      );
    },
  );

  test('replaces and schedules every medication reminder slot', () async {
    await reminder.scheduleMedicationReminder(medication, [8, 20]);

    for (var slot = 0; slot < MedicationReminder.maxReminderSlots; slot++) {
      verify(
        () => scheduler.cancelMedicationReminder(
          MedicationReminder.notificationIdFor(medication.id, slot),
        ),
      ).called(1);
    }
    verify(
      () => scheduler.scheduleMedicationReminder(
        notificationId: -421,
        medicationName: 'Aspirin',
        hour: 8,
      ),
    ).called(1);
    verify(
      () => scheduler.scheduleMedicationReminder(
        notificationId: -422,
        medicationName: 'Aspirin',
        hour: 20,
      ),
    ).called(1);
  });

  test('cancels every possible reminder slot', () async {
    await reminder.cancelMedicationReminder(medication);

    verify(() => scheduler.cancelMedicationReminder(-421)).called(1);
    verify(() => scheduler.cancelMedicationReminder(-430)).called(1);
  });
}
