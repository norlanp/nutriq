import 'package:drift/drift.dart';

class Meals extends Table {
  TextColumn get id => text()();
  TextColumn get code => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get brands => text().nullable()();
  TextColumn get thumbnailImageUrl => text().nullable()();
  TextColumn get mainImageUrl => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get mealQuantity => text().nullable()();
  TextColumn get mealUnit => text().nullable()();
  RealColumn get servingQuantity => real().nullable()();
  TextColumn get servingUnit => text().nullable()();
  TextColumn get servingSize => text().nullable()();
  TextColumn get source => text().withDefault(const Constant('unknown'))();
  RealColumn get energyKcal100 => real().nullable()();
  RealColumn get carbohydrates100 => real().nullable()();
  RealColumn get fat100 => real().nullable()();
  RealColumn get proteins100 => real().nullable()();
  RealColumn get sugars100 => real().nullable()();
  RealColumn get saturatedFat100 => real().nullable()();
  RealColumn get fiber100 => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
