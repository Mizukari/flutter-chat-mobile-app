import 'package:flutter/material.dart';
import 'package:noapp/screens/getting_started/getting_started_screen.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: Image.network(
                  'https://i.pravatar.cc/300?img=3',
                  width: media.width,
                  height: media.height*0.3,
                ),
              ),
              ListTile(
                title: Text('Username'),
                subtitle: Text('username'),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text('email@email.com'),
              ),
              ListTile(
                title: Text('Bio'),
                subtitle: Text('this is text for example'),
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () async {
                  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
                  await _sharedPreferences.setString('username', null);
                  await _sharedPreferences.setString('loginToken', null);
                  await _sharedPreferences.setInt('color_theme', 0xff443a49);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                    return GettingStartedScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
