import 'package:first_app/dice.dart';
import 'package:first_app/dicecard.dart';
import 'package:flutter/material.dart';

class ChooseDicePage extends StatefulWidget {
  const ChooseDicePage({super.key});

  @override
  State<ChooseDicePage> createState() => _ChooseDicePageState();
}

class _ChooseDicePageState extends State<ChooseDicePage> {
  List<Dice> diceList = [];
  @override
  void initState() {
    super.initState();
    addDice();
  }

  void addDice() {
    diceList
        .add(Dice(color: 'assets/images/color_black.png', colorName: 'Black'));
    diceList.add(
        Dice(color: 'assets/images/color_purple.png', colorName: 'Purple'));
    diceList
        .add(Dice(color: 'assets/images/color_green.png', colorName: 'Green'));
    diceList.add(
        Dice(color: 'assets/images/color_yellow.png', colorName: 'Yellow'));
    diceList.add(Dice(color: 'assets/images/color_red.png', colorName: 'Red'));
    diceList
        .add(Dice(color: 'assets/images/color_pink.png', colorName: 'Pink'));
    diceList.add(
        Dice(color: 'assets/images/color_orange.png', colorName: 'Orange'));
    diceList.add(
        Dice(color: 'assets/images/color_default.png', colorName: 'Default'));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose Die Color",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 900
                  ? //                     return constrant.maxWidth > 480
                  Center(
                      child: SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.pop(
                                      context, diceList[index].colorName);
                                },
                                child: DiceCard(dice: diceList[index]));
                          },
                          itemCount: diceList.length,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: size.height - AppBar().preferredSize.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pop(
                                    context, diceList[index].colorName);
                              },
                              child: DiceCard(dice: diceList[index]));
                        },
                        itemCount: diceList.length,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}


// Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   height: size.height,
//                   width: size.width,
//                   child: LayoutBuilder(builder: (context, constrant) {
//                     return constrant.maxWidth > 480
//                         ? Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   return DiceCard(dice: diceList[index]);
//                                 },
//                                 itemCount: diceList.length,
//                               ),
//                             ],
//                           )
//                         : ListView.builder(
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return DiceCard(dice: diceList[index]);
//                             },
//                             itemCount: diceList.length,
//                           );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),