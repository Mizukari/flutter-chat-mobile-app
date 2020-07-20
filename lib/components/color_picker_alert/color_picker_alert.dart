import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noapp/builder/app_builder.dart';
import 'package:noapp/provider/color_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ColorPickerAlert{

  void changeColor(Color color) async{
    pickerColor=color;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('color_theme', color.value);
  }

  Future<Color> getCurrentColor() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt('color_theme'));
  }

  Color pickerColor;
  Color currentColor;


  colorPickers(BuildContext context) async {
    await getCurrentColor().then((Color value) => pickerColor = value);
    await getCurrentColor().then((Color value) => currentColor = value);
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Got it'),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              currentColor = pickerColor;
              prefs.setInt('color_theme', pickerColor.value);
              Provider.of<ColorThemeProvider>(context, listen: false).changeColor(pickerColor);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
