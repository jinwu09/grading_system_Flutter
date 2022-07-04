import 'package:fluent_ui/fluent_ui.dart';
import 'package:grading_system/landing_page.dart';
import 'package:grading_system/model/school.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SchoolAdapter());
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(SubjectsAdapter());
  await Hive.openBox<School>('School');
  await Hive.openBox<School>('Student');
  await Hive.openBox<School>('Subject');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
      ),
      home: const Landingpage(),
    );
  }
}
