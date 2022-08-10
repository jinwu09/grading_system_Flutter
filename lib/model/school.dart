import 'package:hive/hive.dart';

part 'school.g.dart';

@HiveType(typeId: 0)
class Schools extends HiveObject {
  @HiveField(0)
  late String schoolName;

  @HiveField(1)
  late String schoolYear;
}

@HiveType(typeId: 1)
class Students extends HiveObject {
  @HiveField(0)
  late int? inSubject;

  @HiveField(1)
  late String studentName;

  @HiveField(2)
  late String studentSchoolYear;

  @HiveField(3)
  late String studentYearLevel;
}

@HiveType(typeId: 2)
class Subjects extends HiveObject {
  @HiveField(0)
  late int? inSchool;

  @HiveField(1)
  late String subjectName;
}
//flutter packages pub run build_runner build
// to generate (namefile).g.dart