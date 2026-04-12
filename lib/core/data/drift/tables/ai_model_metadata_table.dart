import 'package:drift/drift.dart';

class AiModelMetadataEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get modelVersion => text()();
  TextColumn get assetPath => text()();
  DateTimeColumn get lastUpdated => dateTime()();
}
