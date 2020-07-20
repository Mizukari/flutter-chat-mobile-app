import 'package:flutter/material.dart';
import 'package:noapp/components/search_bar/search_bar.dart';
import 'package:noapp/screens/chat_screen/chat_screen.dart';
import 'dart:math';

class MessageBarContent extends StatefulWidget {
  @override
  _MessageBarContentState createState() => _MessageBarContentState();
}

class _MessageBarContentState extends State<MessageBarContent> {

  List<String> _message = [];
  Random rng;

  @override
  void initState() {
    rng = new Random();
    // TODO: implement initState
    _message.add('Hello M8');
    _message.add('Test');
    _message.add('Lol');
    _message.add('asd');
    _message.add('LL');
    _message.add('Hi There');
    _message.add('After you');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
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
                                builder: (context) => ChatScreen(),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("https://i.pravatar.cc/"+ rng.nextInt(299).toString()),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          title: Text('Name'),
                          subtitle: Text(_message[index]),
                          trailing: Container(margin: EdgeInsets.only(bottom: 20),child: Text('10.00AM')),
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
                },itemCount: _message.length,
            ),
          ),
        ),
        SearchBar(),
      ],
    );
  }
}
