import "package:flutter/material.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/extensions/extensions.dart";

import "./letter_circle.dart";
import "./carousel_slide_controller.dart";

class CarouselSlide extends StatefulWidget {
  CarouselSlide({
    required String word, super.key,
    int initialIndex = 0,
  }) : controller = CarouselSlideController(
          word: word,
          initialIndex: initialIndex,
        );

  final CarouselSlideController controller;

  List<MorseUnit> get currentCharacterUnits => controller.currentCharacterUnits;
  String get currentChar => controller.currentChar;

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  late CarouselSlideValue value = widget.controller.value;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onCharChange);
  }

  void _onCharChange() {
    setState(() {
      value = widget.controller.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
              ? MediaQuery.of(context).size.height * 0.25
              : MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Center(
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: value.word
                  .split("")
                  .mapIndexed(
                    (idx, char) => LetterCircle(
                      character: char,
                      radius: idx == value.currentIdx ? 500 : 300,
                      color:
                          idx == value.currentIdx ? null : Colors.transparent,
                      animated: value.word.length > 1,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onCharChange);

    super.dispose();
  }
}
