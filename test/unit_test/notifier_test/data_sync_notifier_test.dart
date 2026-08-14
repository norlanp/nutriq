import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/features/data_sync/presentation/notifier/data_sync_notifier.dart';
import 'package:nutriq/features/data_sync/presentation/notifier/data_sync_state.dart';
import 'package:nutriq/features/data_sync/providers/data_sync_providers.dart';

class MockEncryptedBackupService extends Mock
    implements EncryptedBackupService {}

void main() {
  late MockEncryptedBackupService backupService;
  late ProviderContainer container;

  setUp(() {
    backupService = MockEncryptedBackupService();
    container = ProviderContainer(
      overrides: [
        encryptedBackupServiceProvider.overrideWithValue(backupService),
      ],
    );
  });

  tearDown(() => container.dispose());

  test('reports encrypted-backup restore success', () async {
    when(
      () => backupService.restoreFromEncryptedBackup(
        '/backups/nutriq.enc',
        'correct-password',
      ),
    ).thenAnswer((_) async => ImportResult.success);

    await container
        .read(dataSyncNotifierProvider.notifier)
        .restoreEncryptedBackup('/backups/nutriq.enc', 'correct-password');

    expect(
      container.read(dataSyncNotifierProvider).status,
      DataSyncStatus.importSuccess,
    );
  });

  test('reports a decrypt error for an invalid password or backup', () async {
    when(
      () => backupService.restoreFromEncryptedBackup(
        '/backups/nutriq.enc',
        'incorrect-password',
      ),
    ).thenAnswer((_) async => ImportResult.error);

    await container
        .read(dataSyncNotifierProvider.notifier)
        .restoreEncryptedBackup('/backups/nutriq.enc', 'incorrect-password');

    final state = container.read(dataSyncNotifierProvider);
    expect(state.status, DataSyncStatus.error);
    expect(
      state.errorMessage,
      'Could not decrypt backup. Check your password and try again.',
    );
  });

  test('reports a restore failure when the backup service throws', () async {
    when(
      () => backupService.restoreFromEncryptedBackup(
        '/backups/missing.enc',
        'password',
      ),
    ).thenThrow(Exception('File not found'));

    await container
        .read(dataSyncNotifierProvider.notifier)
        .restoreEncryptedBackup('/backups/missing.enc', 'password');

    final state = container.read(dataSyncNotifierProvider);
    expect(state.status, DataSyncStatus.error);
    expect(
      state.errorMessage,
      'Restore failed. Check your password and file path, then try again.',
    );
  });
}
