import 'package:drift/drift.dart';

/// Returns the appropriate [QueryExecutor] for the current platform.
///
/// On native (iOS/Android/macOS/etc): uses [NativeDatabase] with sqlite3.
/// On web: uses [WebDatabase] with sql.js.
QueryExecutor createDatabaseConnection() => throw UnsupportedError(
      'No platform implementation found. '
      'Import database_connection_io.dart or database_connection_web.dart.',
    );
