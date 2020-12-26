import 'dart:async';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import 'package:morse_learn/models/models.dart' show Character;
import 'package:morse_learn/utils/utils.dart' show myColorsList;
import 'package:morse_learn/common/common.dart'
    show
        MorseSlide,
        MorseSlider,
        LettersProgress,
        AudioService,
        DoubleKeyKeyboard,
        SingleKeyKeyboard;

class TrainingScreen extends StatefulWidget {
  final int quizDifficulty;
  final int quizLength;
  final List<String> trainingList;
  final List<String> progressList;

  TrainingScreen({
    Key key,
    @required this.quizDifficulty,
    @required this.quizLength,
    @required this.trainingList,
    @required this.progressList,
  }) : super(key: key);

  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  AppLocalizations l10n;
  AudioService audioService;
  Size mySize;
  bool firstTime = true;

  int timeOut = 1250;
  SharedPreferences prefs;
  bool silent = false;
  bool vibration = true;
  bool isSingleKeyKeyboard = false;

  Color inputCorrectOr = Colors.transparent;

  MorseSlide currentSl;
  int currentS = 0;
  Map<String, bool> currentProgress;

  Timer inputTimer;
  Timer hintTimer;
  Widget hintWidget;
  List<bool> typedMorse;

  MorseSlider slider;
  List<MorseSlide> slides;

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      silent = prefs.getBool('silent');
      timeOut = prefs.getInt('timeOut');
      vibration = prefs.getBool('vibration');
      isSingleKeyKeyboard = prefs.getBool('isSingleKeyKeyboard');
    });
  }

  bool isEZMode() {
    return (widget.quizDifficulty * widget.quizLength) <= 100;
  }

  bool isTutoMode() {
    return (widget.quizDifficulty * widget.quizLength) == 0;
  }

  List<MorseSlide> _getSlides(Size mySize) {
    List<MorseSlide> slidesList = List<MorseSlide>();
    List<Color> colorsList;
    List<String> wordsList;

    wordsList = List.from(widget.trainingList);
    if (widget.quizDifficulty > 0) {
      wordsList.shuffle();
      wordsList = List.from(wordsList
          .where((item) => (item.length <= widget.quizDifficulty))
          .take(widget.quizLength));
      wordsList.shuffle();
      wordsList.shuffle();
    }

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

    if (currentS < widget.quizLength) {
      if (currentSl.currentLetter < currentSl.word.length - 1) {
        typedMorse.clear();
        setState(() {
          slider.sliderSlides[currentS] = newSlide;
        });
      } else if (currentS != widget.quizLength - 1) {
        typedMorse.clear();
        slider.sliderController.animateTo(
            slider.sliderController.offset + size.width,
            curve: Curves.linear,
            duration: Duration(milliseconds: 1000));
        setState(() {
          slider.sliderSlides[currentS] = newSlide;
          currentS = currentS + 1;
          slider = slider.copyWith(currentSlide: currentS);
          currentSl = slider.sliderSlides[currentS];
        });
      } else {
        if (isEZMode()) {
          hintTimer.cancel();
        }
        inputTimer.cancel();
        Navigator.of(context).pop();
      }
    }
  }

  addInput(Size size) {
    if (inputTimer != null && inputTimer.isActive) {
      inputTimer.cancel();
    }
    inputTimer = Timer(Duration(milliseconds: timeOut), () {
      bool inputCorrect = checkInput();
      if (inputCorrect) {
        setState(() {
          inputCorrectOr = Colors.green;
        });
        Timer(Duration(milliseconds: 500), () {
          currentProgress[currentSl.word[currentSl.currentLetter]] = true;
          if (!isTutoMode()) {
            if (isEZMode()) {
              hintWidget = null;
            } else {
              hintWidget = Text(l10n.needHelp,
                  style: TextStyle(
                      color: Color(0xfff1e4d4), fontWeight: FontWeight.w900));
            }
          }
          nextCharacter(size);
          if (!isTutoMode() && isEZMode()) {
            Timer(Duration(milliseconds: 500), () => getHint());
          } else if (isTutoMode()) {
            getHint();
          }
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
    if (!isTutoMode()) {
      result.add(Container(
          child: Text(l10n.answer,
              style: TextStyle(
                  color: Color(0xfff1e4d4), fontWeight: FontWeight.w900))));
    }
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
    if (isEZMode()) {
      if (isTutoMode()) {
        setState(() {
          hintWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: result,
          );
        });
      } else {
        if (hintTimer != null && hintTimer.isActive) {
          hintTimer.cancel();
        }
        hintTimer = Timer(Duration(milliseconds: 2000), () {
          setState(() {
            hintWidget = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: result,
            );
          });
        });
      }
    } else {
      setState(() {
        hintWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: result,
        );
      });
    }
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
    currentProgress = Map.fromIterables(List.from(widget.progressList),
        List.filled(widget.progressList.length, false));
    typedMorse = List<bool>();
    audioService = AudioService();
    super.initState();
    _setPrefs();
    if (isEZMode()) {
      if (!isTutoMode()) {
        Timer(Duration(milliseconds: 1200), () {
          getHint();
        });
      }
    }
  }

  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context);
    var size = MediaQuery.of(context).size;

    if (!isEZMode() && hintWidget == null) {
      hintWidget = Text(
        l10n.needHelp,
        style: TextStyle(color: Color(0xfff1e4d4), fontWeight: FontWeight.w900),
      );
    }
    if (firstTime) {
      setState(() {
        mySize = size;
        firstTime = !firstTime;
        slides = _getSlides(mySize);
      });
    }
    slider = MorseSlider(slides: slides, currentSlide: currentS);
    currentSl = slider.sliderSlides[currentS];
    if (isTutoMode()) {
      getHint();
    }

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
                          child: hintWidget != null
                              ? InkWell(
                                  onTap: () {
                                    if (!isEZMode()) {
                                      getHint();
                                    }
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
                                )
                              : SizedBox.shrink()),
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
              child: isSingleKeyKeyboard
                  ? SingleKeyKeyboard(
                      onTap: () {
                        typedMorse.add(true);
                        addInput(mySize);
                        setState(() {});
                        if (!silent) {
                          audioService.playDot();
                        }
                      },
                      onDoubleTap: () {
                        typedMorse.add(false);
                        addInput(mySize);
                        setState(() {});
                        if (!silent) {
                          audioService.playDash();
                        }
                      },
                    )
                  : DoubleKeyKeyboard(
                      onLeftTap: () {
                        typedMorse.add(true);
                        addInput(mySize);
                        setState(() {});
                        if (!silent) {
                          audioService.playDot();
                        }
                      },
                      onRightTap: () {
                        typedMorse.add(false);
                        addInput(mySize);
                        setState(() {});
                        if (!silent) {
                          audioService.playDash();
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (inputTimer != null && inputTimer.isActive) {
      inputTimer.cancel();
    }
    if (hintTimer != null && hintTimer.isActive) {
      hintTimer.cancel();
    }
    super.dispose();
  }
}
