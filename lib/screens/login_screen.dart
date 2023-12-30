import 'dart:convert';
import 'package:fitnessapp/screens/home_screet.dart';
import 'package:fitnessapp/services/firebase_auth.dart';
import 'package:fitnessapp/services/rest_api_service.dart';
import 'package:flutter/services.dart';
import 'package:fitnessapp/screens/fitness_journey_screen.dart';
import 'package:fitnessapp/services/social_auth.dart';
import 'package:fitnessapp/services/toast.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "saurabhsammer@gmail.com";
  String _password = "werty2345";
  GoogleAuthenticationService googleAuthObj = GoogleAuthenticationService();
  String _userToken;
  final Map subscription = {
    "subscriptionId": "atpl035d",
    "days": 5,
    "content": [
      {
        "contentCode": "CNCD-5",
        "shortDesc": "Air Squat",
        "day": 1,
        "type": "warm",
        "desc": "Air Squat 6 reps"
      },
      {
        "contentCode": "CNCD-206",
        "shortDesc": "Yoga Push-Ups",
        "day": 1,
        "type": "warm",
        "desc": "Yoga Push-Ups calf stretch - 6 reps"
      },
      {
        "contentCode": "CNCD-85",
        "shortDesc": "Hip openers",
        "day": 1,
        "type": "warm",
        "desc": "Hip openers 6 reps per side "
      },
      {
        "contentCode": "CNCD-162",
        "shortDesc": "Side Lunges",
        "day": 1,
        "type": "warm",
        "desc": "Side lunges 12 reps"
      },
      {
        "contentCode": "CNCD-78",
        "shortDesc": "Handwalkouts",
        "day": 1,
        "type": "exrc",
        "desc":
            "A-Handwalkouts  8-10 reps  (Do 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-147",
        "shortDesc": "Rare foot",
        "day": 1,
        "type": "exrc",
        "desc": "B1- Rare foot elevated squat 3-5 reps per leg"
      },
      {
        "contentCode": "CNCD-171",
        "shortDesc": "Box jumps",
        "day": 1,
        "type": "exrc",
        "desc":
            "B2- Single leg box jumps (Do B1 and B2 straight after one another, 2-4 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-146",
        "shortDesc": "Quick feet",
        "day": 1,
        "type": "exrc",
        "desc":
            "C-Quick feet (5 seconds) Vertical Jump Squat land 5-8 reps (Do 2-4 sets and rest for 2 minutes after every set"
      },
      {
        "contentCode": "CNCD-150",
        "shortDesc": "Pallof presses",
        "day": 1,
        "type": "exrc",
        "desc": "D1-Resistant band Pallof presses 6-8 reps per side"
      },
      {
        "contentCode": "CNCD-122",
        "shortDesc": "Mountain sliders",
        "day": 1,
        "type": "exrc",
        "desc":
            "D2-Mountain sliders 12-14 reps (Do D1 and D2 straight after one another, 2-4 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-",
        "shortDesc": "DB Romanian dead",
        "day": 1,
        "type": "exrc",
        "desc": "E1-Single leg DB Romanian dead lift 6-8 reps per leg"
      },
      {
        "contentCode": "CNCD-69",
        "shortDesc": "Push-up",
        "day": 1,
        "type": "exrc",
        "desc":
            "E2-Elevated one leg push-up  (Do E1 and E2 straight after one another, 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-207",
        "shortDesc": "Jogging",
        "day": 1,
        "type": "exrc",
        "desc":
            "F- Jogging for 3 minutes at 60% of your Max speed (Do 2 set and rest for 60 seconds in between sets )"
      },
      {
        "contentCode": "CNCD-40",
        "shortDesc": "Squat holds",
        "day": 1,
        "type": "exrc",
        "desc":
            "G-Bottom of Squat holds 20 seconds (Do 2 sets, rest for 60 seconds between sets)"
      },
      {
        "contentCode": "CNCD-81",
        "shortDesc": "High knees",
        "day": 2,
        "type": "warm",
        "desc": "High knees 60 seconds "
      },
      {
        "contentCode": "CNCD-219",
        "shortDesc": "Run",
        "day": 2,
        "type": "warm",
        "desc": "60 seconds on the spot run at 40% of your max speed "
      },
      {
        "contentCode": "CNCD-5",
        "shortDesc": "Air squat",
        "day": 2,
        "type": "warm",
        "desc": "Air squat -6 reps "
      },
      {
        "contentCode": "CNCD-204",
        "shortDesc": "Yoga push-ups",
        "day": 2,
        "type": "warm",
        "desc": "Yoga push-ups -4 reps"
      },
      {
        "contentCode": "CNCD-162",
        "shortDesc": "Side Lunges",
        "day": 2,
        "type": "warm",
        "desc": "Side Lunges – 8 reps "
      },
      {
        "contentCode": "CNCD-206",
        "shortDesc": "Yoga Push-Up",
        "day": 2,
        "type": "exrc",
        "desc": "A1- Yoga Push-Up calf stretch 4-6 reps "
      },
      {
        "contentCode": "CNCD-75",
        "shortDesc": "Lunges",
        "day": 2,
        "type": "exrc",
        "desc":
            "A2- Forward Backward Lunges 4-6 reps (Do A1 and A2 straight after one another, 2-3 sets, and rest for 90 seconds between sets)"
      },
      {
        "contentCode": "CNCD-132",
        "shortDesc": "Plank Tucks",
        "day": 2,
        "type": "exrc",
        "desc": "B1- Plank Tucks 6-8 reps per side"
      },
      {
        "contentCode": "CNCD-69",
        "shortDesc": "Push-Ups",
        "day": 2,
        "type": "exrc",
        "desc":
            "B2- Elevated Push-Ups 8-10 reps (Do B1 and B2 straight after one another, 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-198",
        "shortDesc": "Tuck jumps",
        "day": 2,
        "type": "exrc",
        "desc": "C1- Tuck jumps 6-8 reps"
      },
      {
        "contentCode": "CNCD-62",
        "shortDesc": "DB bird dog",
        "day": 2,
        "type": "exrc",
        "desc":
            "C2-DB bird dog 8-10 reps (Do C1 and C2 straight after one another, 2-3 sets, and rest for 90 seconds between sets)"
      },
      {
        "contentCode": "CNCD-219",
        "shortDesc": "Run",
        "day": 2,
        "type": "exrc",
        "desc":
            "D. On the Spot run 4 minutes (Do 2 Sets, rest for 60 seconds between sets)"
      },
      {
        "contentCode": "CNCD-5",
        "shortDesc": "Air Squat",
        "day": 3,
        "type": "warm",
        "desc": "Air Squat 6 reps "
      },
      {
        "contentCode": "CNCD-206",
        "shortDesc": "Yoga Push-Ups",
        "day": 3,
        "type": "warm",
        "desc": "Yoga Push-Ups calf stretch - 6 reps"
      },
      {
        "contentCode": "CNCD-183",
        "shortDesc": "Squat reaches",
        "day": 3,
        "type": "warm",
        "desc": "Squat reaches 10-12 reps"
      },
      {
        "contentCode": "CNCD-162",
        "shortDesc": "Side lunges",
        "day": 3,
        "type": "warm",
        "desc": "Side lunges 12 reps"
      },
      {
        "contentCode": "CNCD-1",
        "shortDesc": "Burpee",
        "day": 3,
        "type": "exrc",
        "desc":
            "A- 6 Point Burpee  6-8 reps (Do 2 sets, rest for 90 seconds between sets)"
      },
      {
        "contentCode": "CNCD-106",
        "shortDesc": "Knee Jumps",
        "day": 3,
        "type": "exrc",
        "desc":
            "B-Knee Jumps box Jumps 6-8 reps (Do 2 sets, rest for 90 seconds between sets)"
      },
      {
        "contentCode": "CNCD-223",
        "shortDesc": "High knee",
        "day": 3,
        "type": "exrc",
        "desc": "C1- Resistance band high knee 10-12 reps"
      },
      {
        "contentCode": "CNCD-224",
        "shortDesc": "Plyometric Jumps",
        "day": 3,
        "type": "exrc",
        "desc":
            "C2-Lateral plyometric Jumps 6-8 reps (Do C1 and C2 straight after one another, 2-3 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-114",
        "shortDesc": "Lateral V-Ups",
        "day": 3,
        "type": "exrc",
        "desc": "D1-Lateral V-Ups 4-6 reps per side"
      },
      {
        "contentCode": "CNCD-",
        "shortDesc": "Shoulder taps",
        "day": 3,
        "type": "exrc",
        "desc":
            "D2-Shoulder taps push-ups 6-8 reps (Do D1 and D2 straight after one another, 2-3 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-83",
        "shortDesc": "High knee",
        "day": 3,
        "type": "exrc",
        "desc":
            "E-High knee forward run 30 seconds, (Do 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-219",
        "shortDesc": "Run",
        "day": 3,
        "type": "exrc",
        "desc":
            "F- Run for 1 minute 70-90% of Max speed and 2 minutes 40-50% of Max speed (Do 2-3 sets, and rest for 60 seconds after every set)"
      },
      {
        "contentCode": "CNCD-225",
        "shortDesc": "Hamstring stretch",
        "day": 3,
        "type": "exrc",
        "desc":
            "G- Hamstring stretch 20 seconds per leg, (Do 2-3 sets, and rest for 3o seconds after every set)"
      },
      {
        "contentCode": "CNCD-67",
        "shortDesc": "Duck walk",
        "day": 3,
        "type": "exrc",
        "desc":
            "H-Duck walk 8-10 steps (Do 2 sets, rest for 60 seconds between sets) "
      },
      {
        "contentCode": "CNCD-81",
        "shortDesc": "High knees",
        "day": 4,
        "type": "warm",
        "desc": "High knees 60 seconds "
      },
      {
        "contentCode": "CNCD-219",
        "shortDesc": "Run",
        "day": 4,
        "type": "warm",
        "desc": "60 seconds on the spot run at 40% of your max speed"
      },
      {
        "contentCode": "CNCD-5",
        "shortDesc": "Air Squat",
        "day": 4,
        "type": "warm",
        "desc": "Air squat -6 reps "
      },
      {
        "contentCode": "CNCD-204",
        "shortDesc": "Push-Ups",
        "day": 4,
        "type": "warm",
        "desc": "Yoga push-ups -4 reps"
      },
      {
        "contentCode": "CNCD-162",
        "shortDesc": "Side Lunges",
        "day": 4,
        "type": "warm",
        "desc": "Side Lunges – 8 reps "
      },
      {
        "contentCode": "CNCD-85",
        "shortDesc": "Hip Openers",
        "day": 4,
        "type": "warm",
        "desc": "Hip Openers 6 reps per side"
      },
      {
        "contentCode": "CNCD-78",
        "shortDesc": "Handwalkouts",
        "day": 4,
        "type": "exrc",
        "desc":
            "A-Handwalkouts  8-10 reps  (Do 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-91",
        "shortDesc": "Iron wall",
        "day": 4,
        "type": "exrc",
        "desc": "B1- Iron wall chair- 15-20 seconds "
      },
      {
        "contentCode": "CNCD-171",
        "shortDesc": "Box jumps",
        "day": 4,
        "type": "exrc",
        "desc":
            "B2- Single leg box jumps (Do B1 and B2 straight after one another, 2-4 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-146",
        "shortDesc": "Quick feet",
        "day": 4,
        "type": "exrc",
        "desc":
            "C-Quick feet (5 seconds) Vertical Jump Squat land 5-8 reps (Do 2-4 sets and rest for 2 minutes after every set"
      },
      {
        "contentCode": "CNCD-150",
        "shortDesc": "Pallof presses",
        "day": 4,
        "type": "exrc",
        "desc": "D1-Resistant band Pallof presses 6-8 reps per side"
      },
      {
        "contentCode": "CNCD-122",
        "shortDesc": "Mountain sliders",
        "day": 4,
        "type": "exrc",
        "desc":
            "D2-Mountain sliders 12-14 reps (Do D1 and D2 straight after one another, 2-4 sets, and rest for 2 minutes between sets)"
      },
      {
        "contentCode": "CNCD-",
        "shortDesc": "Romanian dead lift",
        "day": 4,
        "type": "exrc",
        "desc": "E1-Single leg DB Romanian dead lift 6-8 reps per leg"
      },
      {
        "contentCode": "CNCD-47",
        "shortDesc": "Broad jumps",
        "day": 4,
        "type": "exrc",
        "desc":
            "E2-Broad jumps 6-8 reps  (Do E1 and E2 straight after one another, 2-3 sets, and rest for 90 seconds after every set)"
      },
      {
        "contentCode": "CNCD-207",
        "shortDesc": "Jogging",
        "day": 4,
        "type": "exrc",
        "desc":
            "F- Jogging for 3 minutes at 60% of your Max speed (Do 2 set and rest for 60 seconds in between sets )"
      },
      {
        "contentCode": "CNCD-40",
        "shortDesc": "Squat holds",
        "day": 4,
        "type": "exrc",
        "desc":
            "G-Bottom of Squat holds 20 seconds (Do 2 sets, rest for 60 seconds between sets)"
      },
      {
        "contentCode": "CNCD-5",
        "shortDesc": "Air Squat",
        "day": 5,
        "type": "warm",
        "desc": "Air Squat 6 reps "
      },
      {
        "contentCode": "CNCD-206",
        "shortDesc": "Yoga Push-Ups",
        "day": 5,
        "type": "warm",
        "desc": "Yoga Push-Ups calf stretch - 6 reps"
      },
      {
        "contentCode": "CNCD-183",
        "shortDesc": "Squat reaches",
        "day": 5,
        "type": "warm",
        "desc": "Squat reaches 10-12 reps"
      },
      {
        "contentCode": "CNCD-162",
        "shortDesc": "Side lunges",
        "day": 5,
        "type": "warm",
        "desc": "Side lunges 12 reps"
      },
      {
        "contentCode": "CNCD-23",
        "shortDesc": "Bear Crawl",
        "day": 5,
        "type": "exrc",
        "desc": "A1- Bear Crawl front 6 steps and back 6 steps "
      },
      {
        "contentCode": "CNCD-200",
        "shortDesc": "Calf Jumps",
        "day": 5,
        "type": "exrc",
        "desc":
            "A2-Vertical Calf Jumps 8-10 reps  (Do A1 and A2 straight after one another, 2-3 sets, and rest for 2 minutes after every set)"
      },
      {
        "contentCode": "CNCD-149",
        "shortDesc": "Deadbug",
        "day": 5,
        "type": "exrc",
        "desc": "B1- Resistant band deadbug 8-10 reps"
      },
      {
        "contentCode": "CNCD-3",
        "shortDesc": "Abdominal cocoons",
        "day": 5,
        "type": "exrc",
        "desc":
            "B2-Abdominal cocoons 8-10 reps  (Do B1 and B2 straight after one another, 2-3 sets, and rest for 90 seconds after every set) "
      },
      {
        "contentCode": "CNCD-226",
        "shortDesc": "100 M Sprint",
        "day": 5,
        "type": "exrc",
        "desc":
            "C-100 M Sprint 90-100% of Max speed 2 reps (3 sets, rest for 2 minutes)"
      },
      {
        "contentCode": "CNCD-225",
        "shortDesc": "Hamstring Stretch",
        "day": 5,
        "type": "exrc",
        "desc":
            "D-Hamstring Stretch 20-3 seconds per side (Do 2 sets, rest for 30 seconds between sets)"
      },
      {
        "contentCode": "CNCD-85",
        "shortDesc": "Hip openers",
        "day": 5,
        "type": "exrc",
        "desc":
            "E-Hip openers 6 reps per side (Do 2 sets, rest for 30 seconds between sets)"
      }
    ]
  };

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
      drawerScrimColor: Colors.teal,
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
                      onChanged: (value) => {
                        setState(() => {_email = value})
                      },
                      decoration: InputDecoration(
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
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2)),
                        errorBorder: OutlineInputBorder(
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
                      child: Text(
                        "Resume my fitness journey",
                        style: TextStyle(color: kActiveFontColor),
                      ),
                      onPressed: () async {
                        try {
                          _userToken = await FirebaseAuthentication
                              .authenticateFireBaseUser(_email, _password);
                          await UseDisk.writeData("mail", _email);
                          await UseDisk.writeData("token", _userToken);
                          Navigator.pushNamed(context, FitnessJourneyScreen.id);
                        } catch (e) {
                          print(e);
                          ToastMsg.createToast(
                              "Oops! Something went wrong. Check your internet connection and try again.");
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
                    child: SignInButton(
                      Buttons.Google,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      onPressed: () async {
                        try {
                          final data = await googleAuthObj.handleSignIn();
                          final response = await RestAPIService.makeGetRequset(
                              '/user/${data["email"]}');
                          if (json.decode(response.body)["success"] == false) {
                            throw Error();
                          }
                          await UseDisk.writeData("mail", _email);
                          await UseDisk.writeData("token", data["token"]);
                          print("token = " + data["token"]);
                          await UseDisk.writeData(
                              'subscription', jsonEncode(subscription));
                          Navigator.pushNamed(context, HomeScreen.id);
                        } catch (e, s) {
                          print(e);
                          print(s);
                          ToastMsg.createToast(
                              "Oops! Something went wrong. Check your internet connection and try again.");
                        }
                      },
                    ),
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
