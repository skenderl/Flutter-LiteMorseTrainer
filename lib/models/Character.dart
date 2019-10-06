import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

import 'package:morse_learn/utils/utils.dart';

class Character {
  AudioCache cache;
  List<bool> characterList;

  Character(String char) {
    cache = new AudioCache();
    cache.loadAll(['audio/dot.mp3', 'audio/dash.mp3']);
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
      String first = characterList[0] ? "audio/dot.mp3" : "audio/dash.mp3";
      int firstWait = characterList[0] ? 300 : 500;
      cache.play(first);
      if (characterList.length > 1) {
        Timer(Duration(milliseconds: firstWait), () {
          playDotOrDash(1, characterList.length - 1);
        });
      }
    }
  }

  playDotOrDash(int current, int max) {
    if (current <= max) {
      String now = characterList[current] ? "audio/dot.mp3" : "audio/dash.mp3";
      if (characterList[current - 1]) {
        Timer(Duration(milliseconds: 300), () {
          cache.play(now);
          Timer(Duration(milliseconds: 300), () {
            if (current != max) {
              playDotOrDash(current + 1, max);
            }
          });
        });
      } else if (!characterList[current - 1]) {
        Timer(Duration(milliseconds: 500), () {
          cache.play(now);
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
