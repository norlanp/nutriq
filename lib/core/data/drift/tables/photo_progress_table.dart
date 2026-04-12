import 'package:drift/drift.dart';

class PhotoProgressEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get filePath => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get tags => text()();
  TextColumn get note => text().nullable()();
}
