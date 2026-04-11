// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intake_dao.dart';

// ignore_for_file: type=lint
mixin _$IntakeDaoMixin on DatabaseAccessor<AppDatabase> {
  $IntakesTable get intakes => attachedDatabase.intakes;
  $MealsTable get meals => attachedDatabase.meals;
  IntakeDaoManager get managers => IntakeDaoManager(this);
}

class IntakeDaoManager {
  final _$IntakeDaoMixin _db;
  IntakeDaoManager(this._db);
  $$IntakesTableTableManager get intakes =>
      $$IntakesTableTableManager(_db.attachedDatabase, _db.intakes);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db.attachedDatabase, _db.meals);
}
