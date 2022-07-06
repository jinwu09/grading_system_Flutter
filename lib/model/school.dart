import 'package:hive/hive.dart';

part 'school.g.dart';

@HiveType(typeId: 0)
class School extends HiveObject {
  @HiveField(0)
  late String schoolName;

  @HiveField(1)
  late String schoolYear;
}

@HiveType(typeId: 1)
class Student extends HiveObject {
  @HiveField(0)
  late String studentName;

  @HiveField(1)
  late String studentSchoolYear;

  @HiveField(2)
  late String studentYearLevel;
}

@HiveType(typeId: 2)
class Subjects extends HiveObject {
  @HiveField(0)
  late String subjectName;

  @HiveField(1)
  late String subjectSchoolYear;
}
//flutter packages pub rub build_runner build
// to generate (namefile).g.dart