import 'package:fitnessapp/screens/registration_screen.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/login_screen.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, LoginScreen.id)},
                  color: kScaffoldBackgroundColor,
                  child: Text(
                    "I Already Have An Account",
                    style: TextStyle(color: kActiveFontColor, fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("images/newlogo.png"),
                  backgroundColor: kScaffoldBackgroundColor,
                  radius: 50,
                ),
                Text(
                  "SayesFit",
                  style: TextStyle(color: kActiveFontColor, fontSize: 50),
                )
              ],
            ),
            Text(
              "Your mobile Fitness Coach",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image(image: AssetImage("images/welcome.jpeg")),
            SizedBox(height: 150),
            Text(
              "The perfect plan for your fitness goals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("GET STARTED"),
                    color: kActiveFontColor,
                    onPressed: () =>
                        {Navigator.pushNamed(context, RegistrationScreen.id)},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                ),
                SizedBox(width: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
