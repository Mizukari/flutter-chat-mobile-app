import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top:6.0),
      color: Colors.white,
      height: media.height*0.06,
      width: media.width,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            Text(
              ' Search',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
              ),
            ),
          ],
        ),
      )
    );
  }
}
