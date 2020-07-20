import 'dart:convert';

import 'package:noapp/models/add_friend_request.dart';
import 'package:noapp/models/add_friend_response.dart';
import 'package:noapp/models/get_friends_response.dart';
import 'package:http/http.dart' as http;
import 'package:noapp/models/info_user_response.dart';
import 'package:noapp/models/login_post_request.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../../env.dart';

class UserServices {

  final String baseUrl = Env().getHostRomi();

  AddFriendResponse _addFriendResponse = AddFriendResponse();
  AddFriendRequest _addFriendRequest = AddFriendRequest();

  Future<InfoUserResponse> getUserInfo(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('loginToken');
    final response = await http.get(
      "$baseUrl/user/$user",
      headers: {
        "content-type": "application/json",
        "authorization": "Bearer $token",
      }
    ).timeout(Duration(seconds: 20),onTimeout: (){
      throw Exception('Failed to get user info. Timeout');
    });
    return InfoUserResponse.fromJson(json.decode(response.body));
  }

  Future<GetFriendsResponse> getListFriends() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('loginToken');
    String user = prefs.getString('username');
    final response = await http.get(
      "$baseUrl/user/friend/$user",
      headers: {
        "content-type": "application/json",
        "authorization": "Bearer $token",
      }
    ).timeout(Duration(seconds: 20),onTimeout: (){
      throw Exception('Failed to fetch friends. Timeout');
    });
    return GetFriendsResponse.fromJson(json.decode(response.body));
  }

  Future<AddFriendResponse> addFriend(String friendToAdd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('loginToken');
    String user = prefs.getString('username');
    final response = await http.post(
      "$baseUrl/user/addfriend",
      headers: {
        "content-type": "application/json",
        "authorization": "Bearer $token",
      },
      body: jsonEncode(AddFriendRequest(username: user,friend: friendToAdd).toJson()),
    );
    return AddFriendResponse.fromJson(json.decode(response.body));
  }
}
