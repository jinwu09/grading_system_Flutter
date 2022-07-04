import 'package:hive/hive.dart';
import 'package:grading_system/model/school.dart';

class Boxes{
  static Box<School> getSchool() =>
  Hive.box<School>('School');
}