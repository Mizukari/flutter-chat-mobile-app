import 'package:flutter/material.dart';

class ProfileFriendsScreen extends StatefulWidget {
  @override
  _ProfileFriendsScreenState createState() => _ProfileFriendsScreenState();
}

class _ProfileFriendsScreenState extends State<ProfileFriendsScreen> {

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Image.network(
                        'https://i.pravatar.cc/300?img=3',
                        width: media.width,
                        height: media.height*0.3,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 0,
                      left: 300,
                      bottom: 10,
                      child: ButtonTheme(
                        child: RaisedButton(
                          shape: CircleBorder(),
                            child: Icon(
                                Icons.send
                                    ,color: Theme.of(context).primaryColor,
                            ),
                            elevation: 0.0,
                            color: Colors.white,
                            textColor: Colors.white,
                            onPressed: () async {
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ListTile(
                title: Text('Username'),
                subtitle: Text('username'),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text('email@email.com'),
              ),
              ListTile(
                title: Text('Bio'),
                subtitle: Text('this is text for example'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
