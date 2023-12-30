import 'package:fitnessapp/components/sub_card.dart';
import 'package:fitnessapp/screens/fitness_journey_screen.dart';
import 'package:fitnessapp/screens/home_screet.dart';
import 'package:fitnessapp/screens/payment_method.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  static const id = 'subscription_screen';
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String chosenLevel;
  Map<String, String> levelRecommendation = {
    'Beginner': 'Basic Training Stuff',
    'Intermediate': 'Intermediate Training Stuff',
    'Advance': 'Advance Training Stuff',
    'Athlete': 'Athlete Training Stuff'
  };
  List<String> levels;

  @override
  void initState() {
    super.initState();
    levels = ["Beginner", "Intermediate", "Advance", "Athlete"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: UseDisk.readData("level"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            chosenLevel = snapshot.data;
            levels.remove(chosenLevel);
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Text(
                    "Recommended Plan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kActiveFontColor),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  SubCard(
                    colour: kCardColor,
                    heading: chosenLevel,
                    body: levelRecommendation[chosenLevel],
                    cardHeight: 200,
                    payPrice: "Pay",
                    performOnClick: () {
                      Navigator.pushNamed(context, PaymentMethodScreen.id);
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Other Plans",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kActiveFontColor),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  SubCard(
                    colour: kCardColor,
                    heading: levels[0],
                    body: levelRecommendation[levels[0]],
                    cardHeight: 200,
                    payPrice: "Change Plan",
                    performOnClick: () {
                      UseDisk.writeData("level", levels[0]);
                      Navigator.pushNamed(context, FitnessJourneyScreen.id);
                    },
                  ),
                  SizedBox(height: 10),
                  SubCard(
                    colour: kCardColor,
                    heading: levels[1],
                    body: levelRecommendation[levels[1]],
                    cardHeight: 200,
                    payPrice: "Change Plan",
                  ),
                  SizedBox(height: 10),
                  SubCard(
                    colour: kCardColor,
                    heading: levels[2],
                    body: levelRecommendation[levels[2]],
                    cardHeight: 200,
                    payPrice: "Change Plan",
                    performOnClick: () {
                      UseDisk.writeData("level", levels[2]);
                      Navigator.pushNamed(context, FitnessJourneyScreen.id);
                    },
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Or",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  SubCard(
                    colour: kCardColor,
                    heading: '7 Days Free Trail',
                    body: 'Have a free experines for 7 days',
                    cardHeight: 200,
                    payPrice: "Try Free",
                    performOnClick: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
