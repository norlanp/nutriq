// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_day_dao.dart';

// ignore_for_file: type=lint
mixin _$TrackedDayDaoMixin on DatabaseAccessor<AppDatabase> {
  $TrackedDaysTable get trackedDays => attachedDatabase.trackedDays;
  TrackedDayDaoManager get managers => TrackedDayDaoManager(this);
}

class TrackedDayDaoManager {
  final _$TrackedDayDaoMixin _db;
  TrackedDayDaoManager(this._db);
  $$TrackedDaysTableTableManager get trackedDays =>
      $$TrackedDaysTableTableManager(_db.attachedDatabase, _db.trackedDays);
}
