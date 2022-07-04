import 'package:fluent_ui/fluent_ui.dart';
import 'package:grading_system/model/school.dart';
import 'package:hive/hive.dart';
import 'package:grading_system/boxes.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({Key? key}) : super(key: key);
  @override
  State<Landingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Landingpage> {
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

  Future addSchool(String name, String year) async {
    final school = School()
      ..SchoolName = name
      ..SchoolYear = year;

    final box = Boxes.getSchool();
    box.add(school);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() {
                index = i;
              }),
          displayMode: PaneDisplayMode.compact,
          items: [
            PaneItem(icon: Icon(FluentIcons.more), title: Text("data")),
            PaneItem(icon: Icon(FluentIcons.help), title: Text('hey there')),
          ]),
      content: NavigationBody(
        index: index,
        children: [
          ScaffoldPage(
            header: Text('Schools'),
            content: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text('column 1'),
                        Button(
                            child: Text('Add School'),
                            onPressed: () {
                              index++;
                              ContentDialog(
                                title: Text('Add School'),
                                content: TextBox(
                                  controller: null,
                                  header: 'School Name',
                                  placeholder: 'School name',
                                ),
                                backgroundDismiss: true,
                                actions: [
                                  Button(
                                      child: Text('add Schoool'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })
                                ],
                              );
                            })
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('hello'),
                  ],
                )
              ],
            ),
          ),
          ScaffoldPage(
            header: Text('sample2'),
          ),
        ],
      ),
      // content: NavigationBody(
      //   index: 0,
      //   children: [Text(index.toString())],
      // ),
    );
  }
}
