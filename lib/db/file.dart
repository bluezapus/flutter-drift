import 'package:drift/drift.dart';

class Bz_file extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().named('file_name')();
  TextColumn get author => text().named('author')();
  DateTimeColumn get dateofCreate => dateTime().named('datepfCreate')();
  TextColumn get fill => text().named('fill')();
}
