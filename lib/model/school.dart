import 'package:hive/hive.dart';

part 'school.g.dart';
@HiveType(typeId: 0)
class School extends HiveObject{
  @HiveField(0)
  late String SchoolName;
  
  @HiveField(1)
  late String SchoolYear;
}

@HiveType(typeId: 1)
class Student extends HiveObject{
  @HiveField(0)
  late String StudentName;

@HiveField(1)
  late String StudentSchoolYear;

@HiveField(2)
  late String StudentYearLevel;
}

@HiveType(typeId: 2)
class Subjects extends HiveObject{
  @HiveField(0)
  late String SubjectName;

@HiveField(1)
  late String SubjectSchoolYear;

}