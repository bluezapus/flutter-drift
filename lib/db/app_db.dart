import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_drift/db/file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'file.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Bz_file])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  //Get the List of File
  Future<List<Bz_fileData>> getBz_file() async {
    return await select(bzFile).get();
  }

  Future<Bz_fileData> getFile(int id) async {
    return await (select(bzFile)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateFile(Bz_fileCompanion entity) async {
    return await update(bzFile).replace(entity);
  }

  Future<int> insertFile(Bz_fileCompanion entity) async {
    return await into(bzFile).insert(entity);
  }

  Future<int> deleteFile(int id) async {
    return await (delete(bzFile)..where((tbl) => tbl.id.equals(id))).go();
  }
}
