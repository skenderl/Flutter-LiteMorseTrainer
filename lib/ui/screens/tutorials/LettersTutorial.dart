import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:vibration/vibration.dart';

import 'package:morse_learn/utils/utils.dart';
import 'package:morse_learn/ui/widgets/MorseWidgets.dart';
import 'package:morse_learn/models/Word.dart';

class LettersTutorial extends StatefulWidget {
  LettersTutorial({Key key}) : super(key: key);

  _LettersTutorialState createState() => _LettersTutorialState();
}

class _LettersTutorialState extends State<LettersTutorial> {
  AudioCache cache;
  Size mySize;
  bool firstTime = true;

  int timeOut = 1250;
  SharedPreferences prefs;
  bool silent = false;
  bool vibration = true;

  Color inputCorrectOr = Colors.transparent;

  MorseSlide currentSl;
  int currentS = 0;
  Map<String, bool> currentProgress =
      Map.fromIterables(List.from(letters), List.filled(26, false));

  Timer inputTimer;
  Widget hintWidget;
  List<bool> typedMorse;

  int quizLength = 26;

  MorseSlider slider;
  List<MorseSlide> slides;

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      silent = prefs.getBool('silent');
      timeOut = prefs.getInt('timeOut');
      vibration = prefs.getBool('vibration');
    });
  }

  List<MorseSlide> _getSlides(Size mySize) {
    List<MorseSlide> slidesList = List<MorseSlide>();
    List<Color> colorsList;
    List<String> wordsList;

    wordsList = List.from(letters);
    colorsList = List.from(myColorsList);
    colorsList.shuffle();
    colorsList.shuffle();
    int colorIter = 0;
    for (var myWord in wordsList) {
      Color contColor = colorsList[colorIter];
      colorIter++;
      MorseSlide newSlide = MorseSlide(
          color: contColor,
          size: mySize,
          word: myWord.toUpperCase(),
          currentLetter: 0);
      slidesList.add(newSlide);
    }
    return slidesList;
  }

  nextCharacter(Size size) {
    currentS = slider.slideCurrent;
    currentSl = slider.sliderSlides[currentS];
    MorseSlide newSlide = MorseSlide(
        color: currentSl.color,
        size: currentSl.size,
        word: currentSl.word,
        currentLetter: currentSl.currentLetter + 1);

    if (currentS < quizLength) {
      if (currentSl.currentLetter < currentSl.word.length - 1) {
        typedMorse.clear();
        setState(() {
          slider.sliderSlides[currentS] = newSlide;
        });
      } else if (currentS != quizLength - 1) {
        typedMorse.clear();
        slider.sliderController.animateTo(
            slider.sliderController.offset + size.width,
            curve: Curves.linear,
            duration: Duration(milliseconds: 1000));
        setState(() {
          slider.sliderSlides[currentS] = newSlide;
          currentS = currentS + 1;
          slider.slideCurrent = currentS;
          currentSl = slider.sliderSlides[currentS];
        });
      } else {
        inputTimer.cancel();
        Navigator.of(context).pop();
      }
    }
  }

  addInput(Size size) {
    if (inputTimer != null && inputTimer.isActive) {
      inputTimer.cancel();
    }
    inputTimer = Timer(Duration(milliseconds: 1250), () {
      bool inputCorrect = checkInput();
      if (inputCorrect) {
        setState(() {
          inputCorrectOr = Colors.green;
        });
        Timer(Duration(milliseconds: 500), () {
          currentProgress[currentSl.word[currentSl.currentLetter]] = true;
          getHint();
          nextCharacter(size);
          setState(() {
            inputCorrectOr = Colors.transparent;
          });
        });
      } else {
        if (vibration) {
          Vibration.vibrate(duration: 500);
        }
        setState(() {
          inputCorrectOr = Colors.red;
        });
        Timer(Duration(milliseconds: 500), () {
          typedMorse.clear();
          setState(() {
            inputCorrectOr = Colors.transparent;
          });
        });
      }
    });
  }

  bool checkInput() {
    bool inputResult;
    currentS = slider.slideCurrent;
    currentSl = slider.sliderSlides[currentS];
    String inputChar = currentSl.word[currentSl.currentLetter];
    Character inputCharacter = Character(inputChar);
    inputResult =
        IterableEquality().equals(typedMorse, inputCharacter.characterList);
    return inputResult;
  }

  getHint() {
    Character char = Character(currentSl.word[currentSl.currentLetter]);
    List<bool> charBools = char.characterList;
    List<Widget> result = List<Widget>();
    result.add(Container(
      width: 2,
    ));
    Widget dash = Container(
      width: mySize.width * 0.08,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Color(0xfff1e4d4)),
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    );
    Widget dot = Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Color(0xfff1e4d4)),
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    );
    for (var i = 0; i < charBools.length; i++) {
      if (charBools[i]) {
        result.add(dot);
        result.add(Container(
          width: 2,
        ));
      } else {
        result.add(dash);
        result.add(Container(
          width: 2,
        ));
      }
    }
    setState(() {
      hintWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: result,
      );
    });
  }

  List<Widget> getTyped(List<bool> typed, Size size) {
    List<Widget> result = List<Widget>();
    result.add(Container());
    Widget dash = Container(
      width: size.width * 0.08,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    );
    Widget dot = Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    );
    if (typed != null) {
      for (var i = 0; i < typed.length; i++) {
        if (typedMorse[i]) {
          result.add(dot);
          result.add(Container(
            width: 2,
          ));
        } else {
          result.add(dash);
          result.add(Container(
            width: 2,
          ));
        }
      }
    }
    return result;
  }

  void initState() {
    typedMorse = List<bool>();
    cache = new AudioCache();
    cache.loadAll(['audio/dot.mp3', 'audio/dash.mp3']);
    super.initState();
    _setPrefs();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (firstTime) {
      setState(() {
        mySize = size;
        firstTime = !firstTime;
        slides = _getSlides(mySize);
      });
    }
    slider = MorseSlider(slides: slides, currentSlide: currentS);
    currentSl = slider.sliderSlides[currentS];
    getHint();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                slider,
                LettersProgress(
                  height: 50,
                  width: size.width,
                  color: Colors.transparent,
                  circlesMap: currentProgress,
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                        left: size.width * 0.2,
                        right: size.width * 0.2),
                    height: 50,
                    width: mySize.width,
                    child: FittedBox(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            getHint();
                          },
                          child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                              child: hintWidget),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: size.width,
              color: inputCorrectOr,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getTyped(typedMorse, size),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[350],
              indent: size.width * 0.2,
              endIndent: size.width * 0.2,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          typedMorse.add(true);
                          addInput(mySize);
                          setState(() {});
                          if (!silent) {
                            cache.play('audio/dot.mp3');
                          }
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[350],
                    thickness: 1.5,
                    indent: 16,
                    endIndent: 16,
                  ),
                  Expanded(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          typedMorse.add(false);
                          addInput(mySize);
                          setState(() {});
                          if (!silent) {
                            cache.play('audio/dash.mp3');
                          }
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(),
                            Container(
                              width: size.width * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
