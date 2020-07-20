import 'dart:convert';

class SignUpRequest {
  String name;
  String username;
  String password;
  String email;

  SignUpRequest({this.name, this.username, this.password, this.email});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }

  String signUpRequestToJson(SignUpRequest signUpRequest) {
    final jsonData = signUpRequest.toJson();
    return json.encode(jsonData);
  }
}
