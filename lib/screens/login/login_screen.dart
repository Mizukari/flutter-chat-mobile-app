import 'package:flutter/material.dart';
import 'package:noapp/models/login_post_request.dart';
import 'package:noapp/screens/home/home_screen.dart';
import 'package:noapp/screens/sign_up_screen/sign_up_screen.dart';
import 'package:noapp/services/api/api_services.dart';
import 'dart:developer' as developer;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _username;
  String _password;

  ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          height: media.height,
          width: media.width,
          child: Column(children: <Widget>[
            Center(
              heightFactor: 1.7,
              child: Container(
                margin: EdgeInsets.all(media.height*0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(5.0),
                      child: Text(
                          'Sign In',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontFamily: 'Segoe UI'),
                          hintText: 'Username',
                          border: const UnderlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0.0))
                          ),
                        ),
                        onChanged: (String num){
                          setState(() {
                            _username = num;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: const UnderlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                            ),
                          ),
                          onChanged: (String pass) {
                            setState(() {
                              _password = pass;
                            });
                          }
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Dont have account? '),
                        InkWell(
                            child: Text('Create One!',style: TextStyle(color: Colors.blue),),
                            onTap: (){
                              Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (BuildContext context){
                                  return SignUpScreen();
                                })
                              );
                            }
                        )
                      ],
                    ),
                    Text("  "),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 40.0,
                      child: RaisedButton(
                          child: Text(
                            'Sign In',
                          ),
                          elevation: 0.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () async {
                            LoginPostRequest loginPostRequest = LoginPostRequest(username: _username,password: _password);
                            var login = await _apiServices.login(loginPostRequest);
                            if (login.status=="200"){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                                return HomeScreen();
                              }));
                            }
                          }
                      ),
                    ),
                  ],),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
