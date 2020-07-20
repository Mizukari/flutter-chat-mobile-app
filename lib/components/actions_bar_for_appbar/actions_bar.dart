import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noapp/screens/add_friend_screen/add_friend_screen.dart';
import 'package:provider/provider.dart';

class ActionsBar extends ChangeNotifier{

  getActions(BuildContext context,int index){
    if(index==0){
      return <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10,top: 5),
          child: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFriendScreen(),
                ),
              );
            },
            icon: Icon(Icons.person_add),
          )
        ),
      ];
    }
    if(index==1){
      return <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 10,top: 5),
            child: IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFriendScreen(),
                  ),
                );
              },
              icon: Icon(Icons.menu),
            )
        ),
      ];
    }
  }

}
