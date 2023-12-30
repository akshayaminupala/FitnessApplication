import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';

class SubCard extends StatelessWidget {
  SubCard(
      {@required this.colour,
      this.heading,
      this.body,
      this.onPress,
      this.cardHeight,
      this.payPrice,
      this.performOnClick});

  final Color colour;
  final String heading;
  final String body;
  final Function onPress;
  final double cardHeight;
  final String payPrice;
  final Function performOnClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: cardHeight,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  heading,
                  style: TextStyle(fontSize: 20, fontFamily: kGoogleFontFamily),
                ),
              ),
            ),
          ),
          Divider(thickness: 5),
          Container(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                    child: Text(
                  body,
                  style: TextStyle(fontSize: 20, fontFamily: kGoogleFontFamily),
                ))),
          ),
          Expanded(
              child: Container(
            color: kPaymentButtonColor,
            child: Center(
                child: GestureDetector(
              onTap: performOnClick,
              child: Text(
                payPrice,
                style: TextStyle(fontSize: 20),
              ),
            )),
          ))
        ],
      ),
    );
  }
}
