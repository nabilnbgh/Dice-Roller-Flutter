import 'dart:math';

import 'package:first_app/choosedice.dart';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
//properties
  var diceNum = 1;
  String dicePath = '';
  late String colorName;
//methods
  void rollDice() {
    setState(() {
      //random from 0 to 5
      diceNum = randomizer.nextInt(6) + 1;
      setDiceImage(colorName);
    });
  }

  void setDiceImage(String name) {
    colorName = name;
    setState(() {
      switch (name) {
        case 'Black':
          dicePath = 'assets/images/dice_black_$diceNum.png';
        case 'Yellow':
          dicePath = 'assets/images/dice_yellow_$diceNum.png';
        case 'Red':
          dicePath = 'assets/images/dice_red_$diceNum.png';
        case 'Orange':
          dicePath = 'assets/images/dice_orange_$diceNum.png';
        case 'Purple':
          dicePath = 'assets/images/dice_purple_$diceNum.png';
        case 'Pink':
          dicePath = 'assets/images/dice_pink_$diceNum.png';
        case 'Green':
          dicePath = 'assets/images/dice_green_$diceNum.png';
          break;
        default:
          dicePath =
              'assets/images/dice_$diceNum.png'; // Handle any other value of 'path'
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    colorName = "Default";
    setDiceImage(colorName);
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          dicePath,
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          child: const Text('Press to Roll the Dice'),
        ),
        TextButton(
          onPressed: () async {
            String? name = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChooseDicePage()));
            if (name != null) {
              setDiceImage(name);
            } else {}
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          child: const Text('Press to Change the Dice'),
        ),
      ],
    );
  }
}
