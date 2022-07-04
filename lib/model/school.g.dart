// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolAdapter extends TypeAdapter<School> {
  @override
  final int typeId = 0;

  @override
  School read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return School()
      ..SchoolName = fields[0] as String
      ..SchoolYear = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, School obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.SchoolName)
      ..writeByte(1)
      ..write(obj.SchoolYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student()
      ..StudentName = fields[0] as String
      ..StudentSchoolYear = fields[1] as String
      ..StudentYearLevel = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.StudentName)
      ..writeByte(1)
      ..write(obj.StudentSchoolYear)
      ..writeByte(2)
      ..write(obj.StudentYearLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubjectsAdapter extends TypeAdapter<Subjects> {
  @override
  final int typeId = 2;

  @override
  Subjects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subjects()
      ..SubjectName = fields[0] as String
      ..SubjectSchoolYear = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Subjects obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.SubjectName)
      ..writeByte(1)
      ..write(obj.SubjectSchoolYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
