import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noapp/models/info_user_response.dart';
import 'package:noapp/services/api/user_services.dart';

class SearchNewFriendBar extends StatefulWidget {
  @override
  _SearchNewFriendBarState createState() => _SearchNewFriendBarState();
}

class _SearchNewFriendBarState extends State<SearchNewFriendBar> {

  String _inputSearch;

  UserServices _userServices = UserServices();

  Data friendInfo;

  bool searched = false;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(" ");

    if (friendInfo!=null) {
      child = Column(
        children: <Widget>[
          Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://i.pravatar.cc/200',)
                  )
              )
          ),
          Text(friendInfo.name),
          ButtonTheme(
            height: 40.0,
            child: RaisedButton(
                child: Text(
                  'Add Friend',
                ),
                elevation: 0.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () async {
                  UserServices _userServices = UserServices();
                  _userServices.addFriend(_inputSearch);
                }
            ),
          ),
        ],
      );
    } else if(friendInfo==null && searched==true){
      child = Text('User Not Found');
    } else {
      child = Text('  ');
    }

    Size media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Container(
                  width:media.width*0.75,
                  child: TextField(
                    obscureText: false,
                    onChanged: (String username) {
                      setState(() {
                        _inputSearch=username;
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(0.0))
                        ),
                        hintText: 'Enter your friends username',
                        hintStyle: TextStyle(fontFamily: 'Segoe UI')
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: ()async{
                      searched = true;
                      await _userServices.getUserInfo(_inputSearch).then(
                              (value) => {
                                if(value.status==200){
                                  print('get data'),
                                  setState((){
                                    friendInfo=value.data;
                                  })
                                }
                                else{
                                  setState((){
                                    friendInfo=null;
                                  })
                                }
                              }
                      );
                    },
                    icon: Icon(Icons.search),
                  )
                ),

              ],
            ),
          ),

          child,
        ],
      ),
    );
  }
}
