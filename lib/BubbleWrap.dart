import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleWrapView extends StatefulWidget {

  BubbleWrapView(this.size, {super.key});
  int size = 0;

  @override
  State<BubbleWrapView> createState() => _BubbleWrapState(size);

}



class _BubbleWrapState extends State<BubbleWrapView> {

  int size = 0;
  final List<bool> bubbleChance = [];
  List<bool> bubblesRevealed = [];

  _BubbleWrapState(int pSize) {
    size = pSize;
    bubblesRevealed = List.filled(size, false);
    for (int i = 0; i < size; i++) {
      bubbleChance.add(Random().nextBool());
    }
  }


  void createTodo(String input) {
    if (input.isNotEmpty) {
      setState(() {
        bubblesRevealed.add(false);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      padding: const EdgeInsets.all(20),
      children: bubbles(),
    );
  }

  List<Widget> bubbles() {
    List<Widget> allBubbles = [];

    for (int i = 0; i < bubblesRevealed.length; i++) {
      if (!bubblesRevealed[i]) {
        allBubbles.add(
          TextButton(
              onPressed: () {
                if (bubblesRevealed[i] == false) {
                  setState(() { bubblesRevealed[i] = true; });
                }
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black26)),
              child: Text(''))
        );
      } else {
        allBubbles.add(
          IconButton(onPressed: () {}, icon: (bubbleChance[i] ? Icon(Icons.check) : Icon(Icons.close)))
        );
      }
    }
    return allBubbles;
  }
}