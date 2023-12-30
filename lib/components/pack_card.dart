import 'package:flutter/material.dart';

class PackCard extends StatelessWidget {
  PackCard(
      {@required this.colour, this.cardChild, this.onPress, this.cardHeight});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: cardChild,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        height: cardHeight,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
