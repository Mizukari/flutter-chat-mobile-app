import 'dart:convert';

class LoginPostRequest {
  String username;
  String password;

  LoginPostRequest({this.username, this.password});

  LoginPostRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password,};
  }

  String loginPostRequestToJson(LoginPostRequest loginData) {
    final jsonData = loginData.toJson();
    return json.encode(jsonData);
  }
}
