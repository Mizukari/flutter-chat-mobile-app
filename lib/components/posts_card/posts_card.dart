import 'dart:math';

import 'package:flutter/material.dart';

class PostCard{
  Random rng = new Random();
  Widget regularPosts(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                margin: EdgeInsets.only(right: 10.0,bottom: 10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/"+ rng.nextInt(299).toString()),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              Text('Name',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
            ],
          ),
          Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et'),
          Container(
            margin: EdgeInsets.only(top: 7.0,bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_upward),
                Icon(Icons.arrow_downward),
                Text('  Comment',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                Text('  ')
              ],
            ),
          ),
          const Divider(
                color: Colors.black,
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
