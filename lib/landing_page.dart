
import 'dart:ffi';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:grading_system/db/model.dart';
import 'package:grading_system/db/school_database.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({Key? key}) : super(key: key);
  @override
  State<Landingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Landingpage>{
  late  List<School> school;
  bool isLoading = false;

  @override
  void dispose(){
    LocalDatabase.instance.close();

    super.dispose();
  }
  
    @override
  void initState(){
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    school = await LocalDatabase.instance.readAllSchool();

    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      
    );
  }
}