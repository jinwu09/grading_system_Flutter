import 'package:fluent_ui/fluent_ui.dart';
import 'package:grading_system/model/school.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grading_system/boxes.dart';

void main() => runApp(GradingPage());

class GradingPage extends StatefulWidget {
  @override
  State<GradingPage> createState() => _GradingPageState();
}

class _GradingPageState extends State<GradingPage> {
  bool isdisable = false;
  @override
  void initState() {
    super.initState();
  }

  Future addSchool(String name, String year) async {
    final school = School()
      ..schoolName = name
      ..schoolYear = year;

    final box = Boxes.getSchool();
    box.add(school);
  }

  void addSchoolDialog(BuildContext context) async {
    final firstfeild = TextEditingController();
    final secondfeild = TextEditingController();
    // first column size
    final result = await showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: Text('Add School'),
        content: Column(
          children: [
            TextBox(
              controller: firstfeild,
              header: 'School Name',
              placeholder: 'School name',
            ),
            TextBox(
              controller: secondfeild,
              header: 'School Year',
              placeholder: 'School Year',
            )
          ],
        ),
        backgroundDismiss: true,
        actions: [
          Button(
              child: Text('Cancel'), onPressed: () => Navigator.pop(context)),
          Button(
              child: Text('Add School'),
              onPressed: () {
                setState(() {});
                addSchool(firstfeild.text, secondfeild.text);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Widget buildSchoolList(List<School> schools, double column) {
    if (schools.isEmpty) {
      return const Center(
        child: Text(
          'No School Data',
          style: TextStyle(fontSize: 15),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: schools.length,
        itemBuilder: (BuildContext context, int index) {
          final school = schools[index];
          return Container(
              width: column - 25,
              child: Row(
                children: [
                  Button(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                        child: Text('School Sample'),
                      ),
                      onPressed: () {}),
                  DropDownButton(
                    // title: Icon(FluentIcons.more),
                    items: [
                      MenuFlyoutItem(text: Text('Delete'), onPressed: () {}),
                      MenuFlyoutItem(text: Text('Edit'), onPressed: () {})
                    ],
                  )
                ],
              ));
        },
      );
    }
  }

  Widget build(BuildContext context) {
    double first_column = 200;
    double second_column = 200;
    double third_column = MediaQuery.of(context).size.width - 450;

    return ScaffoldPage(
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: first_column,
                  height: MediaQuery.of(context).size.height - 90,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text('Schools'),
                              ),
                              Button(
                                  child: Text('Add School'),
                                  onPressed: isdisable
                                      ? null
                                      : () {
                                          addSchoolDialog(context);
                                        })
                            ],
                          ),
                          Container(
                            width: first_column - 22,
                            child: Button(
                              child: Text('School Sample'),
                              onPressed: () {},
                            ),
                          ),
                          ValueListenableBuilder<Box<School>>(
                              valueListenable: Boxes.getSchool().listenable(),
                              builder: (context, box, _) {
                                final school =
                                    box.values.toList().cast<School>();
                                return buildSchoolList(school, first_column);
                              })
                        ],
                      ),
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
                    width: second_column,
                    height: MediaQuery.of(context).size.height - 90,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text('Subjects'),
                        ),
                        Button(
                            child: Text('Add Subject'),
                            onPressed: () {
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
                    width: third_column,
                    height: MediaQuery.of(context).size.height - 90,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text('Students'),
                            ),
                            Button(
                                child: Text('Add Students'),
                                onPressed: () {
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
                        Expanded(
                            child: ValueListenableBuilder<Box<School>>(
                                valueListenable: Boxes.getSchool().listenable(),
                                builder: (context, box, _) {
                                  final school =
                                      box.values.toList().cast<School>();
                                  return buildSchoolList(school, third_column);
                                }))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
