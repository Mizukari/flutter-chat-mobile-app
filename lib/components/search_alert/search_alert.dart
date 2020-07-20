import 'package:flutter/material.dart';

class SearchAlert {
  forContact(BuildContext context){
  Size size = MediaQuery.of(context).size;
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: size.width),
        child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    width: size.width*0.7,
                    child: TextField(
                      obscureText: false,
                      onChanged: (String username) {
                      },
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(fontFamily: 'Segoe UI',color: Colors.black)
                      ),
                    ),
                  ),
                ],
                ),
              ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    
  }
}
