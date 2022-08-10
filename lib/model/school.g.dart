// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolsAdapter extends TypeAdapter<Schools> {
  @override
  final int typeId = 0;

  @override
  Schools read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Schools()
      ..schoolName = fields[0] as String
      ..schoolYear = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Schools obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.schoolName)
      ..writeByte(1)
      ..write(obj.schoolYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentsAdapter extends TypeAdapter<Students> {
  @override
  final int typeId = 1;

  @override
  Students read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Students()
      ..inSubject = fields[0] as int?
      ..studentName = fields[1] as String
      ..studentSchoolYear = fields[2] as String
      ..studentYearLevel = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Students obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.inSubject)
      ..writeByte(1)
      ..write(obj.studentName)
      ..writeByte(2)
      ..write(obj.studentSchoolYear)
      ..writeByte(3)
      ..write(obj.studentYearLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsAdapter &&
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
      ..inSchool = fields[0] as int?
      ..subjectName = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Subjects obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.inSchool)
      ..writeByte(1)
      ..write(obj.subjectName);
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
