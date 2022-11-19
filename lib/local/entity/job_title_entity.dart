import 'package:drift/drift.dart';

class JobTitle extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(max: 10)();
  TextColumn get name => text().withLength(max: 100)();
  TextColumn get status => text().withLength(max: 15)();

  Set<Column> get primaryKey => {id};
}