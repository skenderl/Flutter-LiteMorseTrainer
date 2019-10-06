import 'dart:async';

import 'package:morse_learn/models/Word.dart';
export 'package:morse_learn/models/Word.dart';

class Sentence {
  List<Word> words;

  Sentence(String sentence) {
    words = List<Word>();
    List<String> clean;
    clean = cleanString(sentence);
    clean.forEach((cleanWord) => words.add(Word(cleanWord)));
  }

  List<String> cleanString(String sentence) {
    String words = sentence.replaceAll(new RegExp(r'[^\w\s]+'), '').trim();
    List<String> result = words.split(' ');
    result.removeWhere((item) => item == "");
    return result;
  }

  int get length {
    int length = 0;
    for (var i = 0; i < words.length; i++) {
      length += words[i].length;
    }
    return length;
  }

  String toString() {
    String result = "";
    for (var word in words) {
      for (var character in word.characters) {
        for (var char in character.characterList) {
          if (char) {
            result += ".";
          } else {
            result += "_";
          }
        }
        result += " ";
      }
      result += "  ";
    }
    return result;
  }

  playSentence() {
    if (words != null && words.isNotEmpty) {
      Word first = words[0];
      first.playWord();
      if (words.length > 1) {
        Timer(Duration(milliseconds: first.length), () {
          playNextWord(1, words.length - 1);
        });
      }
    }
  }

  playNextWord(int current, int max) {
    if (current <= max) {
      Word now = words[current];
      now.playWord();
      Timer(Duration(milliseconds: now.length), () {
        if (current != max) {
          playNextWord(current + 1, max);
        }
      });
    }
  }
}
