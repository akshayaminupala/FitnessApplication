import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/pack_card.dart';
import 'subscription.dart';

class TrainingScheduleScreen extends StatefulWidget {
  static const id = 'training_schedule_screen';

  @override
  _TrainingScheduleScreenState createState() => _TrainingScheduleScreenState();
}

class _TrainingScheduleScreenState extends State<TrainingScheduleScreen> {
  Color fontColor1 = kInactiveFontColor;
  Color fontColor2 = kInactiveFontColor;
  Color fontColor3 = kInactiveFontColor;
  Color fontColor4 = kInactiveFontColor;
  Color fontColor5 = kInactiveFontColor;
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
                        fontColor5 = kInactiveFontColor,
                        activeButton = 1
                      })
                },
                cardChild: Text(
                  "1 day training schedule",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
                        fontColor5 = kInactiveFontColor,
                        activeButton = 2
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "2 days training schedule",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
                        fontColor5 = kInactiveFontColor,
                        activeButton = 3
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "3 days training schedule",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
                        fontColor5 = kInactiveFontColor,
                        activeButton = 4
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "4 days training schedule",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: fontColor4,
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
                        fontColor4 = kInactiveFontColor,
                        fontColor5 = kActiveFontColor,
                        activeButton = 5
                      })
                },
                colour: kCardColor,
                cardChild: Text(
                  "5 days training schedule",
                  style: TextStyle(
                    fontFamily: kGoogleFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: fontColor5,
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
                    fontSize: 30,
                    color: kInactiveFontColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, SubscriptionScreen.id)},
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
          "Your training schedule?",
          style: TextStyle(
            fontFamily: kGoogleFontFamily,
            fontSize: 30,
          ),
        ),
      ),
      body: _buildList(context),
    );
  }
}
