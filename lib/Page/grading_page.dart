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
  int? subjectIndex;
  int? schoolIndex;
  bool isdisable = false;
  @override
  void initState() {
    super.initState();
  }

  Future addSchool(String name, String year) async {
    final school = Schools()
      ..schoolName = name
      ..schoolYear = year;

    final box = Boxes.getSchool();
    box.add(school);
  }

  Future addSubject(int? inSchool, String subjectName) async {
    final subject = Subjects()
      ..inSchool = inSchool
      ..subjectName = subjectName;
    final box = Boxes.getSubjects();
    box.add(subject);
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

  void addSubjectsDialog(BuildContext context) async {
    final firstfeild = TextEditingController();
    // first column size
    final result = await showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: Text('Add Subject'),
        content: Column(
          children: [
            TextBox(
              controller: firstfeild,
              header: 'Subject Name',
              placeholder: 'Subject name',
            ),
          ],
        ),
        backgroundDismiss: true,
        actions: [
          Button(
              child: Text('Cancel'), onPressed: () => Navigator.pop(context)),
          Button(
              child: Text('Add Subject'),
              onPressed: () {
                setState(() {});
                addSubject(schoolIndex, firstfeild.text);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Widget buildSchoolList(List<Schools> schools, Column) {
    // final filterSchools =
    // schools.where((element) => element.schoolName == 'sample').toList();
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
        // itemCount: filterSchools.length,
        itemBuilder: (BuildContext context, int index) {
          // final school = filterSchools[index];
          final school = schools[index];
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: schoolIndex == school.key
                        ? Colors.green
                        : Colors.grey)),
            child: Row(
              children: [
                Button(
                    child: Container(
                      width: Column - 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              school.schoolName,
                            ),
                          ),
                          // Text(school.key.toString()),
                          Text(
                            school.schoolYear,
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        schoolIndex = school.key;
                      });
                    }),
                DropDownButton(
                  // title: Icon(FluentIcons.more),
                  items: [
                    MenuFlyoutItem(
                        text: Text('Delete'),
                        onPressed: () {
                          Boxes.getSchool().delete(school.key);
                        }),
                    MenuFlyoutItem(text: Text('Edit'), onPressed: () {})
                  ],
                )
              ],
            ),
          );
        },
      );
    }
  }

  Widget buildSubjectsList(List<Subjects> subjects, column, int? atSchool) {
    final filterSubjects =
        subjects.where((element) => element.inSchool == atSchool).toList();
    if (filterSubjects.isEmpty) {
      return const Center(
        child: Text(
          'No School Data',
          style: TextStyle(fontSize: 15),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: filterSubjects.length,
        itemBuilder: (BuildContext context, int index) {
          final subject = filterSubjects[index];
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: subjectIndex == subject.key
                        ? Colors.green
                        : Colors.grey)),
            child: Row(
              children: [
                Button(
                    child: Container(
                      width: column - 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subject.subjectName,
                          ),
                          // Text(subject.inSchool.toString())
                        ],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        subjectIndex = subject.key;
                      });
                    }),
                DropDownButton(
                  // title: Icon(FluentIcons.more),
                  items: [
                    MenuFlyoutItem(
                        text: Text('Delete'),
                        onPressed: () {
                          Boxes.getSchool().delete(subject.key);
                        }),
                    MenuFlyoutItem(text: Text('Edit'), onPressed: () {})
                  ],
                )
              ],
            ),
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    double first_column = 200;
    double second_column = 200;
    double third_column = MediaQuery.of(context).size.width - 550;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
          // height: MediaQuery.of(context).size.height - 85,
          child: Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: first_column - 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('School List'),
                      Button(
                          child: Text('Add'),
                          onPressed: () {
                            addSchoolDialog(context);
                          })
                    ],
                  ),
                ),
                Container(
                    // padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    height: MediaQuery.of(context).size.height - 133,
                    width: first_column,
                    child: buildSchoolValueListener(context, first_column))
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: Card(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: second_column,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subject List'),
                      Button(
                          child: Text('Add'),
                          onPressed: () {
                            addSubjectsDialog(context);
                          })
                    ]),
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 133,
                  width: second_column,
                  child: buildSubjectValueListener(
                    context,
                    second_column,
                  ))
            ],
          )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: Card(
              child: Column(
            children: [
              Container(
                child: Row(
                  children: [Text('Activity Table')],
                ),
              )
            ],
          )),
        )
      ],
    );
  }

  Widget buildSchoolValueListener(BuildContext context, column) {
    return ValueListenableBuilder<Box<Schools>>(
        valueListenable: Boxes.getSchool().listenable(),
        builder: (context, box, _) {
          final school = box.values.toList().cast<Schools>();
          return buildSchoolList(school, column);
        });
  }

  Widget buildSubjectValueListener(BuildContext context, column) {
    return ValueListenableBuilder<Box<Subjects>>(
        valueListenable: Boxes.getSubjects().listenable(),
        builder: (context, box, _) {
          final subjects = box.values.toList().cast<Subjects>();
          return buildSubjectsList(subjects, column, schoolIndex);
        });
  }
}
