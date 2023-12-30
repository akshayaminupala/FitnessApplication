import 'package:fitnessapp/screens/training_schedule_screen.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/pack_card.dart';

class AthleteScreen extends StatefulWidget {
  static const id = 'athlete_screen';

  @override
  _AthleteScreenState createState() => _AthleteScreenState();
}

class _AthleteScreenState extends State<AthleteScreen> {
  Color fontColor1 = kInactiveFontColor;
  Color fontColor2 = kInactiveFontColor;
  Color fontColor3 = kInactiveFontColor;
  int activeButton = 1;

  Widget _buildList(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              PackCard(
                colour: kCardColor,
                onPress: () => {
                  setState(() => {
                        fontColor1 = kActiveFontColor,
                        fontColor2 = kInactiveFontColor,
                        fontColor3 = kInactiveFontColor,
                        activeButton = 1
                      })
                },
                cardChild: Text(
                  "Want to build core strength, improve conditioning and flexibility",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor1,
                  ),
                ),
                cardHeight: 200,
              ),
              PackCard(
                onPress: () => {
                  setState(() => {
                        fontColor1 = kInactiveFontColor,
                        fontColor2 = kActiveFontColor,
                        fontColor3 = kInactiveFontColor,
                        activeButton = 2
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "Want to build muscles and core strength and to improve agility, conditioning and flexibility",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor2,
                  ),
                ),
                cardHeight: 200,
              ),
              PackCard(
                onPress: () => {
                  setState(() => {
                        fontColor1 = kInactiveFontColor,
                        fontColor2 = kInactiveFontColor,
                        fontColor3 = kActiveFontColor,
                        activeButton = 3
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "Want  to build core strength and explosiveness and to improve, conditioning and flexibility",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor3,
                  ),
                ),
                cardHeight: 200,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          color: kActiveFontColor,
          child: GestureDetector(
            child: Center(
              child: Text(
                "Proceed",
                style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: kInactiveFontColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () =>
                {Navigator.pushNamed(context, TrainingScheduleScreen.id)},
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "What are your fitness goals?",
          style: TextStyle(
              fontFamily: kGoogleFontFamily,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildList(context),
    );
  }
}
