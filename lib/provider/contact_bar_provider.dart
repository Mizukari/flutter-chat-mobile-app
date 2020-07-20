import 'package:noapp/models/get_friends_response.dart';
import 'package:noapp/services/api/user_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContactBarProvider extends ChangeNotifier{

  List<Data> _friendData = [];

  ContactBarProvider(){
    setup();
  }

  void setup() async {
    UserServices _userServices =  UserServices();
    await _userServices.getListFriends().then(
            (value) => {
              _friendData = value.data
            }
    );
    notifyListeners();
  }

  List<Data> getFriendData() {
    if(_friendData!=null) {
      return _friendData;
    } else return [];
  }
}
