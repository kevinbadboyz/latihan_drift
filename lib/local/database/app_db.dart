import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:latihan_drift/local/entity/job_title_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part 'app_db.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'dbpayroll.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [JobTitle])
class AppDb extends _$AppDb{
  AppDb(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Get all data from JobTitle
  Future<List<JobTitleData>> getJobTitles() async{
    return await select(jobTitle).get();
  }

  //Get data by id from JobTitle
  Future<JobTitleData> getJobTile(int id) async{
    return await (select(jobTitle)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  //Update data by id from JobTitle
  Future<bool> updateJobTitle(JobTitleCompanion entity) async{
    return await update(jobTitle).replace(entity);
  }

  //Insert new row into JobTitle
  Future<int> insertJobTitle(JobTitleCompanion entity) async{
    return await into(jobTitle).insert(entity);
  }

  //Delete data by id from JobTitle
  Future<int> deleteJobTile(int id) async{
    return await (delete(jobTitle)..where((tbl) => tbl.id.equals(id))).go();
  }
}