import 'package:flutter/material.dart';
import 'package:noapp/components/color_picker_alert/color_picker_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsThemeScreen extends StatefulWidget {
  @override
  _SettingsThemeScreenState createState() => _SettingsThemeScreenState();
}

class _SettingsThemeScreenState extends State<SettingsThemeScreen> {

  Future<String> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Color colorX;

  void setDefaultColorTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      colorX = Color(prefs.getInt('color_theme'));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefaultColorTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: Container(
        child : Column(
          children: <Widget>[
            ListTile(
              title: Text('Change color'),
              trailing: Icon(Icons.lens,color: colorX,),
              onTap: () async {
                ColorPickerAlert().colorPickers(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
