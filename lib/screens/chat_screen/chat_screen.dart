import 'dart:math';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noapp/models/chat_response.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _chatMessages = [];
  Random rng;
  String dropdownValue = 'One';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rng = new Random();
    _chatMessages.add(ChatResponse(id: 0, type: "CHAT", content: "test 1",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 1, type: "CHAT", content: "masuk bos",sender: "boby",receiver: "romi",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 2, type: "CHAT", content: "test 2",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 3, type: "CHAT", content: "ngaps",sender: "boby",receiver: "romi",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 4, type: "CHAT", content: "test 5",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 5, type: "CHAT", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 6, type: "CHAT", content: "masuk bos",sender: "boby",receiver: "romi",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 7, type: "CHAT", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 8, type: "CHAT", content: "ngaps",sender: "boby",receiver: "romi",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 10, type: "CHAT", content: "test 5",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 11, type: "CHAT", content: "test 5",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 12, type: "CHAT", content: "test 5",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
    _chatMessages.add(ChatResponse(id: 13, type: "CHAT", content: "test 5",sender: "romi",receiver: "boby",room: null,dateTime: "2020-06-18T09:29:11"),);
  }
  
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Swipes'),
        actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: DropdownButton<String>(
                icon: Icon(Icons.menu),
                iconEnabledColor: Colors.white,
                iconSize: 24,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: media.height*0.805,
                child: ListView.builder(
                    reverse: true,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.all(5.0),
                              child: Bubble(
                                style:BubbleStyle(
                                  nip: BubbleNip.leftTop,
                                  color: Hexcolor('#dedede'),
                                  elevation: 1 * (1/MediaQuery.of(context).devicePixelRatio),
                                  margin: BubbleEdges.only(top: 8.0, right: 50.0),
                                  alignment: Alignment.topLeft,
                                ),
                                child: Text(
                                    _chatMessages[index].content,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },itemCount: _chatMessages.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: media.height*0.08,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(0.0),
                      width: media.width*0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Hexcolor("#f7f7f7"),
                            hintStyle: TextStyle(fontFamily: 'Segoe UI',color: Colors.black),
                            hintText: 'Type a Message',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                          ),
                          onChanged: (String num){
                          },
                        ),
                      ),
                    ),
                    ButtonTheme(
                      child: RaisedButton(
                          child: Text(
                            'Send',
                          ),
                          elevation: 0.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () async {
                          }
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

