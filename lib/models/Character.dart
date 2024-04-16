import "dart:async";

import "package:morse_learn/services/services.dart";
import "package:morse_learn/extensions/extensions.dart";

enum MorseUnit implements Comparable<MorseUnit> {
  dash(text: "•"),
  dot(text: "━");

  const MorseUnit({required this.text});

  final String text;

  @override
  int compareTo(MorseUnit other) => 0;
}

class Character {
  Character(String char)
      : units = char.toMorseUnits(),
        assert(
          char.length == 1,
          "Should be a single Character",
        );

  final List<MorseUnit> units;

  Future<void> play() => AudioService.play(units);

  @override
  String toString() => units.map((unit) => unit.text).join();
}
