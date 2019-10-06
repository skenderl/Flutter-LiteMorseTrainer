import 'package:flutter/material.dart';

import 'package:morse_learn/ui/widgets/LetterCircle.dart';

class MorseSlide extends StatefulWidget {
  MorseSlide({Key key, this.color, this.size, this.word, this.currentLetter})
      : super(key: key);

  String get slideWord => word;

  final Color color;
  final Size size;
  final String word;
  int currentLetter;

  _MorseSlideState createState() => _MorseSlideState();
}

class _MorseSlideState extends State<MorseSlide> {
  List<LetterCircle> get wordSpan {
    List<LetterCircle> wSpan = List<LetterCircle>();

    for (var i = 0; i < widget.word.length; i++) {
      LetterCircle tx;
      if (i == widget.currentLetter) {
        tx = LetterCircle(
          character: widget.word[i],
          radius: 500,
        );
      } else {
        tx = LetterCircle(
          character: widget.word[i],
          radius: 300,
          color: Colors.transparent,
        );
      }
      wSpan.add(tx);
    }
    return wSpan;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      height: widget.size.height * 0.6 - 50,
      width: widget.size.width,
      padding:
          EdgeInsets.only(top: 50.0, bottom: 80.0, left: 20.0, right: 20.0),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: this.wordSpan,
          ),
        ),
      ),
    );
  }
}
