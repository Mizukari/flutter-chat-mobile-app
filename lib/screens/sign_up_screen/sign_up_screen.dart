import 'package:flutter/material.dart';
import 'package:noapp/components/my_alert/my_alert.dart';
import 'package:noapp/models/sign_up_request.dart';
import 'package:noapp/services/api/api_services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String _name;
  String _username;
  String _password;
  String _confirmPassword;
  String _email;

  ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign Up'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        height: media.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                heightFactor: 1,
                child: Container(
                  margin: EdgeInsets.all(media.height*0.04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(0.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(hintText: 'Full Name'),
                        onChanged: (String name){
                          setState(() {
                            _name = name;
                          });
                        },
                      ),
                      TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                          onChanged: (String email) {
                            setState(() {
                              _email = email;
                            });
                          }
                      ),
                      TextField(
                          decoration: InputDecoration(hintText: 'Username'),
                          onChanged: (String username) {
                            setState(() {
                              _username = username;
                            });
                          }
                      ),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (String pass) {
                            setState(() {
                              _password = pass;
                            });
                          }
                      ),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Confirm Password'),
                          onChanged: (String pass) {
                            setState(() {
                              _confirmPassword = pass;
                            });
                          }
                      ),
                      Text("  "),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 40.0,
                        child: RaisedButton(
                            child: Text(
                              'Sign Up',
                            ),
                            elevation: 0.0,
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () async {
                              if(_password!=_confirmPassword){
                                MyAlert().justOkButton(context,"Create Account failed","Password isnt mismatch, check your password again");
                              } else{
                                SignUpRequest signUpRequest = SignUpRequest(name:_name,username: _username,password: _password,email: _email);
                                _apiServices.createAccount(signUpRequest);
                              }
                            }
                        ),
                      ),
                    ],),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
