import 'package:flutter/material.dart';
import 'package:noapp/components/posts_card/posts_card.dart';

class TimelineBarContent extends StatefulWidget {
  @override
  _TimelineBarContentState createState() => _TimelineBarContentState();
}

class _TimelineBarContentState extends State<TimelineBarContent> {

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Flexible(
          flex: 10,
          child: Container(
            color: Colors.white,
            height: media.height,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              child: ListView(
                children: <Widget>[
                  PostCard().regularPosts(context),
                  PostCard().regularPosts(context),
                  PostCard().regularPosts(context),
                  PostCard().regularPosts(context),
                  PostCard().regularPosts(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
