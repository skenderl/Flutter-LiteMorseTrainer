import "dart:async";

import "./character.dart";

const kWordWaitTimeMs = 1300;
const kWordSeperator = " ";

class Word {
  Word(String word)
      : characters = word
            .toUpperCase()
            .split("")
            .map(Character.new)
            .toList();

  final List<Character> characters;

  Future<void> play() => Future.forEach(
        characters,
        (character) async {
          await character.play();
          await Future.delayed(const Duration(milliseconds: kWordWaitTimeMs));
        },
      );

  @override
  String toString() => characters
      .map(
        (char) => char.toString(),
      )
      .join(kWordSeperator);
}
