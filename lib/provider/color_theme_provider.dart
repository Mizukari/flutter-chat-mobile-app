import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeProvider extends ChangeNotifier {

  Color colorProvider;

  ColorThemeProvider(){
    setup();
  }

  void setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    colorProvider = Color(prefs.getInt('color_theme'));
    notifyListeners();
  }

  void changeColor(Color newColor){
    colorProvider = newColor;
    notifyListeners();
  }

  getColorProvider() => colorProvider;



}
