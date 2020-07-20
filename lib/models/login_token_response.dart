import 'dart:convert';
class LoginTokenResponse {
  final String token;
  final String status;

  LoginTokenResponse({this.token,this.status});

//  LoginTokenResponse.fromJson(Map<String, dynamic> json) {
//    token = json['Token'];
//    status = json['Status'];
//  }

  factory LoginTokenResponse.fromJson(Map<String, dynamic> json){
    return LoginTokenResponse(
      token: json['Token'],
      status: json['Status'],
    );
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['Token'] = this.token;
//    data['Status'] = this.status;
//    return data;
//  }
}
