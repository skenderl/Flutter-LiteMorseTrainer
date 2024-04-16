import "dart:async";

import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "package:vibration/vibration.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/configs/configs.dart";
import "package:morse_learn/widgets/widgets.dart";
import "package:morse_learn/services/services.dart";
import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/extensions/extensions.dart";

enum TrainingDifficulty implements Comparable<TrainingDifficulty> {
  easy(length: 10),
  medium(length: 15),
  hard(length: 20),
  tutorial;

  const TrainingDifficulty({this.length})
      : assert(
          length == null || length <= Configs.trainingMaxLength,
          "Training Length should be ommited or lower than ${Configs.trainingMaxLength}",
        );

  final int? length;

  bool get isEZMode => this == TrainingDifficulty.easy;
  bool get isTutoMode => this == TrainingDifficulty.tutorial;

  @override
  int compareTo(TrainingDifficulty other) =>
      (length ?? 0) - (other.length ?? 0);
}

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({
    required this.difficulty,
    required this.items,
    super.key,
    this.progressList,
  });

  final List<String> items;
  final TrainingDifficulty difficulty;
  final List<String>? progressList;

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  bool? inputIsCorrect;
  Timer? inputTimer;
  Timer? hintTimer;
  late bool showHint = widget.difficulty.isTutoMode;
  late final int length = widget.difficulty.length ?? widget.items.length;
  late Map<String, bool>? currentProgress = widget.progressList != null
      ? {for (var itemKey in widget.progressList!) itemKey: false}
      : null;

  final MorseEditingController morseContoller = MorseEditingController();
  late final List<String> _itemsList = widget.difficulty.isTutoMode
      ? widget.items
      : (List<String>.from(widget.items)
          .where(
            (item) => (item.length >= length - 10 && item.length <= length - 5),
          )
          .take(length)
          .toList()
        ..shuffle());
  late final CarouselSliderController sliderContoller =
      CarouselSliderController(
    slides: List<CarouselSlide>.generate(
      length,
      (idx) => CarouselSlide(word: _itemsList[idx].toUpperCase()),
    ),
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.difficulty.isEZMode && !widget.difficulty.isTutoMode) {
        hintTimer = Timer(
          const Duration(milliseconds: 1200),
          () => setState(() {
            showHint = true;
          }),
        );
      }
    });
  }

  void onKeyboardTap(MorseUnit unit) {
    if (context.read<AppSettingsProvider?>()?.sound ?? Configs.defaultSound) {
      AudioService.playUnit(unit);
    }

    final hasCorrectInput = morseContoller.units.equals(
      sliderContoller.currentSlide.currentCharacterUnits,
    );

    if (inputTimer?.isActive ?? false) {
      inputTimer?.cancel();
    }

    inputTimer = Timer(
      Duration(
        milliseconds: context.read<AppSettingsProvider?>()?.keyboardTimeout ??
            Configs.defaultKeyboardTimeout,
      ),
      () {
        if (hasCorrectInput) {
          onCorrectInput();
        } else {
          onIncorrectInput();
        }
      },
    );
  }

  void onIncorrectInput() {
    if (context.read<AppSettingsProvider?>()?.vibration ??
        Configs.defaultVibration) {
      Vibration.vibrate();
    }

    setState(() {
      inputIsCorrect = false;
    });

    if (hintTimer?.isActive ?? false) {
      hintTimer?.cancel();
    }

    hintTimer = Timer(
      const Duration(milliseconds: 500),
      () {
        morseContoller.clear();
        setState(() {
          inputIsCorrect = null;
        });
      },
    );
  }

  void onCorrectInput() {
    setState(() {
      inputIsCorrect = true;
    });

    if (hintTimer?.isActive ?? false) {
      hintTimer?.cancel();
    }

    hintTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        if (sliderContoller.isLastSlide &&
            sliderContoller.currentSlide.controller.isLastChar) {
          Navigator.of(context).pop();
        } else {
          if (currentProgress != null) {
            currentProgress![sliderContoller.currentSlide.currentChar] = true;
          }

          if (!widget.difficulty.isTutoMode && widget.difficulty.isEZMode) {
            setState(() {
              showHint = false;
            });
          }

          await sliderContoller.next(MediaQuery.of(context).size.width);

          morseContoller.clear();

          if (widget.difficulty.isTutoMode || widget.difficulty.isEZMode) {
            setState(() {
              showHint = true;
            });
          }

          setState(() {
            inputIsCorrect = null;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: sliderContoller.duration,
          color: sliderContoller.currentColor,
          child: Column(
            children: <Widget>[
              if (currentProgress != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: LettersProgress(
                    width: MediaQuery.of(context).size.width,
                    circlesMap: currentProgress,
                  ),
                ),
              CarouselSlider(controller: sliderContoller),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: showHint
                    ? MorseInputField(
                        units:
                            sliderContoller.currentSlide.currentCharacterUnits,
                        hint: true,
                      )
                    : const SizedBox(
                        height: kUnitHeight + kMorseInputFieldUnitSpacing,
                      ),
              ),
              AnimatedContainer(
                duration: sliderContoller.duration,
                height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: inputIsCorrect == null
                      ? sliderContoller.currentColor
                      : inputIsCorrect!
                          ? Colors.green
                          : Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  border: Border.all(
                    width: 4,
                    color: const Color(0xff151e2c),
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: sliderContoller.duration,
                    child: inputIsCorrect == null
                        ? MorseInputField(
                            controller: morseContoller,
                            maxLines: 2,
                          )
                        : inputIsCorrect!
                            ? const Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.black,
                                size: 50,
                              )
                            : const Icon(
                                Icons.highlight_remove_rounded,
                                color: Colors.black,
                                size: 50,
                              ),
                  ),
                ),
              ),
              Expanded(
                child:
                    context.watch<AppSettingsProvider?>()?.singleKeyKeyboard ??
                            Configs.defaultSingleKeyKeyboard
                        ? SingleKeyKeyboard(
                            onTap: onKeyboardTap,
                            controller: morseContoller,
                          )
                        : DoubleKeyKeyboard(
                            onTap: onKeyboardTap,
                            controller: morseContoller,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (inputTimer?.isActive ?? false) {
      inputTimer?.cancel();
    }

    if (hintTimer?.isActive ?? false) {
      hintTimer?.cancel();
    }

    super.dispose();
  }
}
