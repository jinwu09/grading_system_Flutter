import 'dart:html';

import 'package:flutter/material.dart';

final String tableSchool = 'School';
final String tableStudents = 'Students';
final String tableSubjects = "Subjects";
final String tableActivities = "Activities";

class SchoolFields{
  static final String id = '_id';
  static final String SchoolName = '_SchoolName';
  static final String SchoolYear = '_SchoolYear';
}
class SubjectsFields{
  static final String id = '_id';
  static final String School_id = "_School_id";
  static final String SubjectName = '_SubjectName';

}
class StudentsFields{
  static final String id = '_id';
  static final String School_id = '_Schoolid';
  static final String StudentName = 'StudentName';
}

class ActivitiesFields{
  static final String id = '_id';
  static final String Student_id = '_Student_id';
  static final String ActivityName = '_ActivityName';
  static final String Score = '_Score';
}

class School{
  final int? id;
  final String SchoolName;
  final String SchoolYear;
  const School({
    this.id,
    required this.SchoolName,
    required this.SchoolYear,
    });
  School copy({
     final int? id;
  final String SchoolName;
  final String SchoolYear;
  })
  Map<String, Object?> toJson() => {
    SchoolFields.id: id,
    SchoolFields.SchoolName: SchoolName,
    SchoolFields.SchoolYear: SchoolYear,
  };
}

class Subject{
  final int? id;
  final int School_id;
  final String SubjectName;
  const Subject({
    this.id,
    required this.School_id,
    required this.SubjectName,
  });
   Map<String, Object?> toJson() => {
    SubjectsFields.id: id,
    SubjectsFields.School_id: School_id,
    SubjectsFields.SubjectName: SubjectName,
  };
}

class Student{
  final int? id;
  final int School_id;
  final String StudentName;
  const Student({
    this.id,
    required this.School_id,
    required this.StudentName,
  });
  Map<String, Object?> toJson() => {
    StudentsFields.id: id,
    StudentsFields.School_id: School_id,
    StudentsFields.StudentName: StudentName,
  };
}
class Activities{
  final int? id;
  final int Student_id;
  final String ActivityName;
  final int Score;
  const Activities({
    this.id,
    required this.Student_id,
    required this.ActivityName,
    required this.Score
  });
    Map<String, Object?> toJson() => {
    ActivitiesFields.id: id,
    ActivitiesFields.Student_id: Student_id,
    ActivitiesFields.Score: Score,
  };
}