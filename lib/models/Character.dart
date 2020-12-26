import 'dart:async';
import 'package:morse_learn/common/common.dart' show AudioService;

import 'package:morse_learn/utils/utils.dart';

class Character {
  AudioService audioService;
  List<bool> characterList;

  Character(String char) {
    characterList = List<bool>();
    characterList = characters[char.toUpperCase()];
  }

  int get length {
    int length = 0;
    for (var i = 0; i < characterList.length; i++) {
      length += characterList[i] ? 600 : 800;
    }
    return length + 500;
  }

  playCharacter() {
    if (characterList != null) {
      int firstWait = characterList[0] ? 300 : 500;
      characterList[0] ? audioService.playDot() : audioService.playDash();
      if (characterList.length > 1) {
        Timer(Duration(milliseconds: firstWait), () {
          playDotOrDash(1, characterList.length - 1);
        });
      }
    }
  }

  playDotOrDash(int current, int max) {
    if (current <= max) {
      if (characterList[current - 1]) {
        Timer(Duration(milliseconds: 300), () {
          characterList[current]
              ? audioService.playDot()
              : audioService.playDash();
          Timer(Duration(milliseconds: 300), () {
            if (current != max) {
              playDotOrDash(current + 1, max);
            }
          });
        });
      } else if (!characterList[current - 1]) {
        Timer(Duration(milliseconds: 500), () {
          characterList[current]
              ? audioService.playDot()
              : audioService.playDash();
          Timer(Duration(milliseconds: 300), () {
            if (current != max) {
              playDotOrDash(current + 1, max);
            }
          });
        });
      }
    }
  }
}
