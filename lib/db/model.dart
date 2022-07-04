

final String tableSchool = 'School';
final String tableStudents = 'Students';
final String tableSubjects = "Subjects";
final String tableActivities = "Activities";

class SchoolFields{
static final List<String> values = [
  id, SchoolName, SchoolYear
];
  static final String id = '_id';
  static final String SchoolName = '_SchoolName';
  static final String SchoolYear = '_SchoolYear';
}
class SubjectsFields{
  static final List<String> values = [
  id, School_id, SubjectName
];
  static final String id = '_id';
  static final String School_id = "_School_id";
  static final String SubjectName = '_SubjectName';

}
class StudentsFields{
  static final List<String> values = [
  id, School_id, StudentName
];
  static final String id = '_id';
  static final String School_id = '_Schoolid';
  static final String StudentName = 'StudentName';
}

class ActivitiesFields{
  static final List<String> values = [
  id, Student_id, ActivityName, Score
];
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
    final int? id,
    final String? SchoolName,
    final String? SchoolYear,
  }) => School(
    id: id ?? this.id,
    SchoolName: SchoolName ?? this.SchoolName,
    SchoolYear: SchoolYear ?? this.SchoolYear,
  );
  static School fromJson(Map<String, Object?> Json) => School(
    id: Json[SchoolFields.id] as int?,
    SchoolName: Json[SchoolFields.SchoolName] as String,
    SchoolYear: Json[SchoolFields.SchoolYear] as String,
  );
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
    Subject copy({
    final int? id,
    final int? School_id,
    final String? SubjectName,
  }) => Subject(
    id: id ?? this.id,
    School_id: School_id ?? this.School_id,
    SubjectName: SubjectName ?? this.SubjectName,
  );
  static Subject fromJson(Map<String, Object?> Json) => Subject(
    id: Json[SubjectsFields.id] as int?,
    School_id: Json[SubjectsFields.School_id] as int,
    SubjectName: Json[SubjectsFields.SubjectName] as String,
  );
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
    Student copy({
    final int? id,
    final int? School_id,
    final String? StudentName,
  }) => Student(
    id: id ?? this.id,
    School_id: School_id ?? this.School_id,
    StudentName: StudentName ?? this.StudentName,
  );
  static Student fromJson(Map<String, Object?> Json) => Student(
    id: Json[StudentsFields.id] as int?,
    School_id: Json[StudentsFields.School_id] as int,
    StudentName: Json[StudentsFields.StudentName] as String,
  );
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
    Activities copy({
    final int? id,
    final int? Student_id,
    final String? ActivityName,
    final int? Score,
  }) => Activities(
    id: id ?? this.id,
    Student_id: Student_id ?? this.Student_id,
    ActivityName: ActivityName ?? this.ActivityName,
    Score: Score ?? this.Score
  );
  static Activities fromJson(Map<String, Object?> Json) => Activities(
    id: Json[ActivitiesFields.id] as int?,
    Student_id: Json[ActivitiesFields.Student_id] as int,
    ActivityName: Json[ActivitiesFields.ActivityName] as String,
    Score: Json[ActivitiesFields.Score] as int,
  );
    Map<String, Object?> toJson() => {
    ActivitiesFields.id: id,
    ActivitiesFields.Student_id: Student_id,
    ActivitiesFields.Score: Score,
  };
}