import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noapp/components/search_alert/search_alert.dart';
import 'package:noapp/components/search_bar/search_bar.dart';
import 'package:noapp/models/get_friends_response.dart';
import 'package:noapp/provider/contact_bar_provider.dart';
import 'package:noapp/screens/profile_friends_screen/profile_friends_screen.dart';
import 'dart:math';
import 'package:noapp/screens/search_screen_contact/search_screen_contact.dart';
import 'package:noapp/services/api/user_services.dart';
import 'package:provider/provider.dart';

class ContactsBarContent extends StatefulWidget {

  final List<Data> _listFrs;

  ContactsBarContent(this._listFrs);

  @override
  _ContactsBarContentState createState() => _ContactsBarContentState(_listFrs);
}

class _ContactsBarContentState extends State<ContactsBarContent> with AutomaticKeepAliveClientMixin<ContactsBarContent> {

  _ContactsBarContentState(this._friendData);

  List<String> friend = [];
  Random rng;
  UserServices _userServices = UserServices();
  List<Data> _friendData= [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    rng = new Random();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ContactBarProvider>(
      create: (_)=>ContactBarProvider(),
      child: Consumer<ContactBarProvider>(
        builder: (context,contact,child){
          return Column(
            children: <Widget>[
              Flexible(
                flex: 10,
                child: Container(
                  height: media.height,
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileFriendsScreen(),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage("https://i.pravatar.cc/"+ rng.nextInt(299).toString()),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              title: Text(contact.getFriendData()[index].friendName),
                              subtitle: Text('this is status'),
                            ),
                            const Divider(
//                color: Colors.black,
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        ),
                      );
                    },itemCount: contact.getFriendData().length,
                  ),
                ),
              ),
              InkWell(
                  onTap: (){
                    SearchAlert().forContact(context);
                  },
                  child: SearchBar()
              ),
            ],
          );
        },
      ),
    );

  }


}
