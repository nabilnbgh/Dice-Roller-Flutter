import 'package:first_app/dice.dart';
import 'package:flutter/material.dart';

class DiceCard extends StatelessWidget {
  const DiceCard({super.key, required this.dice});
  final Dice dice;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              dice.color,
              width: 100,
            ),
          ),
          Text(dice.colorName)
        ],
      ),
    );
  }
}
