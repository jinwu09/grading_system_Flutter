import 'package:fluent_ui/fluent_ui.dart';

void main(List<String> args) {
  runApp(SettingPage());
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isdisable = false;
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
