import 'dart:convert';
import 'package:fitnessapp/screens/fitness_journey_screen.dart';
import 'package:fitnessapp/services/rest_api_service.dart';
import 'package:fitnessapp/services/social_auth.dart';
import 'package:fitnessapp/services/toast.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fitnessapp/services/firebase_auth.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:fitnessapp/services/validation.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email = "saurabhsameer.1995@gmail.com";
  String _password = "werty2345";
  String _displayName;
  String _userToken;
  Map _data;
  GoogleAuthenticationService googleAuthObj = GoogleAuthenticationService();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: kStackBackgroundColor,
          ),
          Container(
            decoration: BoxDecoration(
              color: kScaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250),
                  topLeft: Radius.circular(250)),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          ListView(
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("images/newlogo.png"),
                backgroundColor: kScaffoldBackgroundColor,
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => {_displayName = value},
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Display Name",
                        prefixIcon: Icon(Icons.person),
                        errorText: Validation.validateName(),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20)
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => {_email = value},
                      decoration: InputDecoration(
                        errorText: Validation.validateEmail(_email),
                        fillColor: Colors.white,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20)
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) => {_password = value},
                      decoration: InputDecoration(
                        errorText: Validation.validatePassowrd(_password),
                        fillColor: Colors.white,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20)
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Text("Start my fitness journey"),
                      onPressed: () async {
                        try {
                          _userToken =
                              await FirebaseAuthentication.createFirebaseUser(
                                  _email, _password);
                          _data = {
                            'email': _email,
                            'name': _displayName,
                            'token': _userToken
                          };
                          await RestAPIService.makePostRequest(_data, '/user');
                          await UseDisk.writeData("mail", _email);
                          await UseDisk.writeData("token", _userToken);
                          Navigator.pushNamed(context, FitnessJourneyScreen.id);
                        } catch (e) {
                          print(e);
                          ToastMsg.createToast(
                              "Oops! something went wrong. Check you internet connection and try again.");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                    ),
                  ),
                  SizedBox(width: 20)
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: SignInButton(Buttons.Google,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ), onPressed: () async {
                      try {
                        final Map data = await googleAuthObj.handleSignIn();
                        final response =
                            await RestAPIService.makePostRequest(data, '/user');
                        if (json.decode(response.body)["success"] == false) {
                          throw Error();
                        }
                        await UseDisk.writeData("mail", _email);
                        await UseDisk.writeData("token", data["token"]);
                        Navigator.pushNamed(context, FitnessJourneyScreen.id);
                      } catch (e) {
                        ToastMsg.createToast(
                            "Oops! Something went wrong. Check your internet connection and try again.");
                      }
                    }),
                  ),
                  SizedBox(width: 20)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
