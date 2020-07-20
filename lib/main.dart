import 'package:flutter/material.dart';
import 'package:noapp/builder/app_builder.dart';
import 'package:noapp/provider/color_theme_provider.dart';
import 'package:noapp/screens/getting_started/getting_started_screen.dart';
import 'package:noapp/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String token;
  Color colorX;

  Future<String> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('loginToken');
    });
  }

  void setDefaultColorTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('color_theme')==null){
      await prefs.setInt('color_theme', 0xff443a49);
    } else {
      colorX = Color(prefs.getInt('color_theme'));
    }
  }
  
  @override
  void initState() {
    setDefaultColorTheme();
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
        return ChangeNotifierProvider<ColorThemeProvider>(
          create: (_)=>ColorThemeProvider(),
          child: Consumer<ColorThemeProvider>(
            builder: (context,color,child){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Segoe UI',
                  primaryColor: Provider.of<ColorThemeProvider>(context).getColorProvider(),
                ),
                home: token != null ? HomeScreen() : GettingStartedScreen(),
              );
            }
          ),
        );
  }
}
