import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noapp/components/actions_bar_for_appbar/actions_bar.dart';
import 'package:noapp/provider/contact_bar_provider.dart';
import 'package:noapp/screens/home/bar_content/contacts_bar.dart';
import 'package:noapp/screens/home/bar_content/message_bar.dart';
import 'package:noapp/screens/home/bar_content/settings_bar.dart';
import 'package:noapp/screens/home/bar_content/timeline_bar.dart';
import 'package:noapp/services/api/api_services.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'package:noapp/services/api/user_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ApiServices _apiServices = ApiServices();

  String title;

  int _indexTab = 0;

  UserServices _userServices = UserServices();



  @override
  void initState() {
//    title = await _apiServices.testTitle();
//    Provider.of<ContactBarProvider>(context, listen: false).setup();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: new Container(),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          centerTitle: false,
          actions: ActionsBar().getActions(context,_indexTab),
          title: Text(
            "Swipes",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: TabBar(
                      onTap: (whatIndexNow){
                        setState(() {
                          _indexTab=whatIndexNow;
                        });
                      },
                      tabs: [
                        Tab(icon: Icon(Icons.account_circle,color: Theme.of(context).primaryColor,)),
                        Tab(icon: Icon(Icons.message,color: Theme.of(context).primaryColor,)),
                        Tab(icon: Icon(Icons.dashboard,color: Theme.of(context).primaryColor,)),
                        Tab(icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,)),
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:0.0,top:6.0),
                  child: Container(
                    height: media.height*(74/100),
                    color: Theme.of(context).primaryColor,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        ChangeNotifierProvider<ContactBarProvider>(
                            create: (_)=>ContactBarProvider(),
                            child: Consumer<ContactBarProvider>(
                              builder: (context,contact,child){
                                return ContactsBarContent(Provider.of<ContactBarProvider>(context, listen: false).getFriendData());
                              },
                            ),
//                            child: ContactsBarContent()
                        ),
                        MessageBarContent(),
                        TimelineBarContent(),
                        SettingsBarContent(),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
