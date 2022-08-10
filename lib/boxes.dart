import 'package:hive/hive.dart';
import 'package:grading_system/model/school.dart';

class Boxes {
  static Box<Schools> getSchool() => Hive.box<Schools>('School');

  static Box<Students> getStudents() => Hive.box<Students>('Students');

  static Box<Subjects> getSubjects() => Hive.box<Subjects>('Subjects');
}
