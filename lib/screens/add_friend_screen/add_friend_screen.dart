import 'package:flutter/material.dart';
import 'package:noapp/screens/add_friend_screen/bar_content/qr_friend_bar.dart';
import 'package:noapp/screens/add_friend_screen/bar_content/search_friend_bar.dart';

class AddFriendScreen extends StatefulWidget {
  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Friends'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.nfc),
                text: 'QR Code',
              )
            ],
          ),
        ),
        body:
          TabBarView(
            children: <Widget>[
              SearchNewFriendBar(),
              QrNewFriendBar(),
            ],
          )
        ,
      ),
    );
  }

}
