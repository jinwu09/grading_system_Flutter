import 'package:fluent_ui/fluent_ui.dart';
import 'package:grading_system/Page/grading_page.dart';
import 'package:grading_system/Page/setting_page.dart';
import 'package:grading_system/model/school.dart';
import 'package:hive/hive.dart';
import 'package:grading_system/boxes.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({Key? key}) : super(key: key);
  @override
  State<Landingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Landingpage> {
  late String test = 'default';
  String? school_year;
  String school_name = '';
  int index = 0;
  bool isLoading = false;

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() {
                index = i;
              }),
          displayMode: PaneDisplayMode.top,
          items: [
            PaneItem(
                icon: Icon(FluentIcons.folder), title: Text("School Data")),
            PaneItem(icon: Icon(FluentIcons.settings), title: Text('Settings')),
          ]),
      content: NavigationBody(
        index: index,
        children: [
          // Grading Page
          GradingPage(),
          // SettingsPage
          SettingPage(),
        ],
      ),
    );
  }
}
