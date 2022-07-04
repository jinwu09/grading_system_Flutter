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
            PaneItem(
                icon: Icon(FluentIcons.folder), title: Text("School Data")),
            PaneItem(icon: Icon(FluentIcons.settings), title: Text('Settings')),
          ]),
      content: NavigationBody(
        index: index,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: ScaffoldPage(
              header: Text('Grading System'),
              content: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 50,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 218, 218),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text('Schools'),
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height - 50,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 218, 218),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text('Subjects'),
                              Button(
                                  child: Text('Add Subject'),
                                  onPressed: () {
                                    index++;
                                    ContentDialog(
                                      title: Text('Add Subject'),
                                      content: TextBox(
                                        controller: null,
                                        header: 'Subject Name',
                                        placeholder: 'Subject name',
                                      ),
                                      backgroundDismiss: true,
                                      actions: [
                                        Button(
                                            child: Text('add Subject'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 400,
                          height: MediaQuery.of(context).size.height - 50,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 218, 218),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text('Students'),
                              Button(
                                  child: Text('Add Students'),
                                  onPressed: () {
                                    index++;
                                    ContentDialog(
                                      title: Text('Add Students'),
                                      content: TextBox(
                                        controller: null,
                                        header: 'Students Name',
                                        placeholder: 'Students name',
                                      ),
                                      backgroundDismiss: true,
                                      actions: [
                                        Button(
                                            child: Text('add Students'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
