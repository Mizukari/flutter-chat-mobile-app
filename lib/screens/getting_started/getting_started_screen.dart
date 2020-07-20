import 'package:flutter/material.dart';
import 'package:noapp/screens/login/login_screen.dart';
import 'package:noapp/screens/sign_up_screen/sign_up_screen.dart';

class GettingStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            heightFactor: 1.2,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Take your stuff from anywhere',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Segoe UI'
                    ),
                  ),
                  Image.asset('assets/images/get_started.gif'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
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
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                                return SignUpScreen();
                              }));
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account? '),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                  return LoginScreen();
                                }));
                              },
                              child : Text('Sign in',style: TextStyle(color: Colors.blue),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
