
import 'dart:developer';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:grading_system/db/model.dart';

class LocalDatabase{
  static final LocalDatabase instance = LocalDatabase._init();

  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('school.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getApplicationDocumentsDirectory();
    // log(${getDatabasesPath()},);
    // final dbPath = await getDatabasesPath();
    final path = join (dbPath.toString(), filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // log("creating database");
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
  await db.execute('''
CREATE TABLE $tableSchool
${SchoolFields.id} $idType,
${SchoolFields.SchoolName} $textType,
${SchoolFields.SchoolYear} $integerType,
''');
await db.execute('''
CREATE TABLE $tableSchool
${StudentsFields.id} $idType,
${StudentsFields.School_id} $textType
${StudentsFields.StudentName} $textType
''');
await db.execute('''
CREATE TABLE $tableSubjects
${SubjectsFields.id} $idType,
${SubjectsFields.School_id} $integerType
${SubjectsFields.SubjectName} $textType
''');
await db.execute('''
CREATE TABLE $tableActivities
${ActivitiesFields.id} $idType,
${ActivitiesFields.Student_id} $integerType,
${ActivitiesFields.ActivityName} $textType,
${ActivitiesFields.Score} $integerType
''');
  }
//  Insert function
 Future<School> InsertSchool(School school) async {
  final db = await instance.database;

  final id = await db.insert(tableSchool, school.toJson());
  return school.copy(id: id);
 }
 Future<Student> InsertStudents(Student school) async {
  final db = await instance.database;

  final id = await db.insert(tableStudents, school.toJson());
  return school.copy(id: id);
 }
  Future<Subject> InsertSubjects(Subject school) async {
  final db = await instance.database;

  final id = await db.insert(tableSubjects, school.toJson());
  return school.copy(id: id);
 }
  Future<Activities> InsertActivities(Activities school) async {
  final db = await instance.database;

  final id = await db.insert(tableActivities, school.toJson());
  return school.copy(id: id);
 }
//  Read Function
Future<School> readSchool(int id) async{
  final db = await instance.database;

  final maps = await db.query(
    tableSchool,
    columns: SchoolFields.values,
    where: '${SchoolFields.id} = ?',
    whereArgs: [id],
  );
  if (maps.isNotEmpty){
    return School.fromJson(maps.first);
  }else {
    throw Exception('ID $id not found');
  }
}
Future<List<School>> readAllSchool() async{
  final db = await instance.database;
  final orderby = '${SchoolFields.SchoolYear} ASC';
  final result = await db.query(tableSchool, orderBy: orderby);
  return result.map((json)=>School.fromJson(json)).toList();
}

// Update
Future<int> Update(School school) async{
  final db = await instance.database;

  return db.update(
    tableSchool,
    school.toJson(),
    where: '${SchoolFields.id} = ?',
    whereArgs: [school.id],
    );
}

//delete
  // School
Future<int> delete(int id)async{
  final db = await instance.database;

  return await db.delete(
    tableSchool,
    where: '${SchoolFields.id} = ?',
    whereArgs: [id],
  );
}
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}