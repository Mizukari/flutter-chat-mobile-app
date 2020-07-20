import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:collection';

import 'package:noapp/screens/profile_screen/profile_screen.dart';
import 'package:noapp/screens/settings_theme_screen/settings_theme_screen.dart';

class SettingsBarContent extends StatefulWidget {
  @override
  _SettingsBarContentState createState() => _SettingsBarContentState();

}

class _SettingsBarContentState extends State<SettingsBarContent> {

  List<String> _options = [];
  List<IconData> _optionsIcon = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Flexible(
          flex: 10,
          child: Container(
            height: media.height,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profiles'),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                ),
                ListTile(
                  leading: Icon(Icons.format_paint),
                  title: Text('Themes'),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsThemeScreen(),
                      ),
                    );
                  },
                ),

              ],
            )
          ),
        ),
      ],
    );
  }
}

