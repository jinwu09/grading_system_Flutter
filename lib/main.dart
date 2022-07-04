import 'package:fluent_ui/fluent_ui.dart';
import 'package:grading_system/landing_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
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
