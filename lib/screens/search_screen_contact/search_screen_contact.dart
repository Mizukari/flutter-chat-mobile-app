import 'package:flutter/material.dart';

class SearchScreenContact extends StatefulWidget {
  @override
  _SearchScreenContactState createState() => _SearchScreenContactState();
}

class _SearchScreenContactState extends State<SearchScreenContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
      TextField(
        obscureText: false,
        onChanged: (String username) {
        },
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Search',
          labelStyle: TextStyle(fontFamily: 'Segoe UI',color: Colors.black)
        ),
      ),
        ],
      ),
    );
  }
}
