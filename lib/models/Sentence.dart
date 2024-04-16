import "dart:async";

import "./word.dart";

const kSentenceWaitTimeMs = 2000;
const kSentenceSeperator = "  ";

class Sentence {
  Sentence(String sentence)
      : words = sentence
            .replaceAll(RegExp(r"[^\w\s]+"), "")
            .trim()
            .split(" ")
            .where((word) => word.isNotEmpty)
            .map(Word.new)
            .toList();

  final List<Word> words;

  void play() => Future.forEach(
        words,
        (word) async {
          await word.play();
          await Future.delayed(
            const Duration(milliseconds: kSentenceWaitTimeMs),
          );
        },
      );

  @override
  String toString() => words
      .map(
        (word) => word.toString(),
      )
      .join(kSentenceSeperator);
}
