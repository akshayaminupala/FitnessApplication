import 'package:fitnessapp/screens/advanced_screen.dart';
import 'package:fitnessapp/screens/athlete_screen.dart';
import 'package:fitnessapp/screens/beginner_screen.dart';
import 'package:fitnessapp/screens/intermediate_screen.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/pack_card.dart';

import '../services/use_disk_space.dart';

class FitnessJourneyScreen extends StatefulWidget {
  static const id = 'fitness_joiurney';

  @override
  _FitnessJourneyScreenState createState() => _FitnessJourneyScreenState();
}

class _FitnessJourneyScreenState extends State<FitnessJourneyScreen> {
  Color fontColor1 = kInactiveFontColor;
  Color fontColor2 = kInactiveFontColor;
  Color fontColor3 = kInactiveFontColor;
  Color fontColor4 = kInactiveFontColor;
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
                        fontColor4 = kInactiveFontColor,
                        activeButton = 1
                      })
                },
                cardChild: Text(
                  "Beginner",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor1,
                  ),
                ),
                cardHeight: 100,
              ),
              PackCard(
                onPress: () => {
                  setState(() => {
                        fontColor1 = kInactiveFontColor,
                        fontColor2 = kActiveFontColor,
                        fontColor3 = kInactiveFontColor,
                        fontColor4 = kInactiveFontColor,
                        activeButton = 2
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "Intermediate",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor2,
                  ),
                ),
                cardHeight: 100,
              ),
              PackCard(
                onPress: () => {
                  setState(() => {
                        fontColor1 = kInactiveFontColor,
                        fontColor2 = kInactiveFontColor,
                        fontColor3 = kActiveFontColor,
                        fontColor4 = kInactiveFontColor,
                        activeButton = 3
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "Advanced",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor3,
                  ),
                ),
                cardHeight: 100,
              ),
              PackCard(
                onPress: () => {
                  setState(() => {
                        fontColor1 = kInactiveFontColor,
                        fontColor2 = kInactiveFontColor,
                        fontColor3 = kInactiveFontColor,
                        fontColor4 = kActiveFontColor,
                        activeButton = 4
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "Athlete",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 25,
                    color: fontColor4,
                  ),
                ),
                cardHeight: 100,
              ),
            ],
          ),
        ),
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
            onTap: () async {
              if (activeButton == 1) {
                await UseDisk.writeData("level", "Beginner");
                Navigator.pushNamed(context, BeginnerScreen.id);
              } else if (activeButton == 2) {
                await UseDisk.writeData("level", "Intermediate");
                Navigator.pushNamed(context, IntermediateScreen.id);
              } else if (activeButton == 3) {
                await UseDisk.writeData("level", "Advance");
                Navigator.pushNamed(context, AdvancedScreen.id);
              } else {
                await UseDisk.writeData("level", "Athlete");
                Navigator.pushNamed(context, AthleteScreen.id);
              }
            },
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
          "What is your fitness level?",
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
