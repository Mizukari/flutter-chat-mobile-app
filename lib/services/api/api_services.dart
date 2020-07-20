import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:noapp/components/my_alert/my_alert.dart';
import 'package:noapp/env.dart';
import 'dart:convert';

import 'package:noapp/models/login_post_request.dart';
import 'package:noapp/models/login_token_response.dart';
import 'package:noapp/models/sign_up_request.dart';
import 'package:noapp/models/sign_up_response.dart';
import 'package:noapp/models/test_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {

  final String baseUrl = Env().getHostRomi();

  LoginPostRequest loginPostRequest = LoginPostRequest();
  SignUpRequest signUpRequest = SignUpRequest();

  Future<LoginTokenResponse> login(LoginPostRequest data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      "$baseUrl/user/login",
      headers: {"content-type": "application/json",},
      body: loginPostRequest.loginPostRequestToJson(data),
    ).timeout(Duration(seconds: 10),onTimeout: (){
      throw Exception('Failed to Login. Timeout');
    });

    print(LoginTokenResponse.fromJson(json.decode(response.body)));
    prefs.setString('loginToken', LoginTokenResponse.fromJson(json.decode(response.body)).token);
    prefs.setString('username', data.username);
    return LoginTokenResponse.fromJson(json.decode(response.body));
  }

  Future<SignUpReponse> createAccount(SignUpRequest data) async {
    final response = await http.post(
      "$baseUrl/user/signup",
      headers: {"content-type": "application/json"},
      body: signUpRequest.signUpRequestToJson(data),
    ).timeout(Duration(seconds: 10),onTimeout: (){
      throw Exception('Failed to Create. Timeout');
    });
    return SignUpReponse.fromJson(json.decode(response.body));
  }

  Future<TestResponse> testTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      "$baseUrl/test",
      headers: {
        "content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer '+prefs.getString('loginToken'),
      },
    ).timeout(Duration(seconds: 10),onTimeout: (){
      throw Exception('Failed to Login. Timeout');
    });

    return TestResponse.fromJson(json.decode(response.body));
  }

}
