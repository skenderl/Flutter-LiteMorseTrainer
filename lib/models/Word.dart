import 'dart:async';

import 'package:morse_learn/models/Character.dart';
export 'package:morse_learn/models/Character.dart';

class Word {
  List<Character> characters;

  Word(String word) {
    characters = List<Character>();
    for (var i = 0; i < word.length; i++) {
      String char = word[i].toUpperCase();
      Character character = Character(char);
      characters.add(character);
    }
  }

  int get length {
    int length = 0;
    for (var i = 0; i < characters.length; i++) {
      length += characters[i].length;
    }
    return length + 1300;
  }

  playWord() {
    if (characters != null && characters.isNotEmpty) {
      Character first = characters[0];
      first.playCharacter();
      if (characters.length > 1) {
        Timer(Duration(milliseconds: first.length), () {
          playNextCharacter(1, characters.length - 1);
        });
      }
    }
  }

  playNextCharacter(int current, int max) {
    if (current <= max) {
      Character now = characters[current];
      now.playCharacter();
      Timer(Duration(milliseconds: now.length), () {
        if (current != max) {
          playNextCharacter(current + 1, max);
        }
      });
    }
  }
}
