import "package:flutter/foundation.dart";

import "package:morse_learn/models/models.dart";

class CarouselSlideController extends ValueNotifier<CarouselSlideValue> {
  CarouselSlideController({
    required String word,
    required int initialIndex,
  }) : super(
          CarouselSlideValue(
            word: word,
            charIdx: initialIndex,
          ),
        );

  String get word => value._word;
  bool get isLastChar => value._currentIdx >= value.word.length - 1;
  bool get isFirstChar => value._currentIdx == 0;
  List<MorseUnit> get currentCharacterUnits =>
      Character(word[value._currentIdx]).units;
  String get currentChar => word[value._currentIdx];

  void next() {
    if (value._currentIdx < value._word.length - 1) {
      value = value.copyWith(
        charIdx: value._currentIdx + 1,
      );

      notifyListeners();
    }
  }

  void previous() {
    if (value._currentIdx > 0) {
      value = value.copyWith(
        charIdx: value._currentIdx - 1,
      );

      notifyListeners();
    }
  }
}

@immutable
class CarouselSlideValue {
  const CarouselSlideValue({
    required String word,
    required int charIdx,
  })  : _word = word,
        _currentIdx = charIdx;

  final int _currentIdx;
  final String _word;

  int get currentIdx => _currentIdx;
  String get word => _word;

  CarouselSlideValue copyWith({
    String? word,
    int? charIdx,
  }) {
    return CarouselSlideValue(
      word: word ?? _word,
      charIdx: charIdx ?? _currentIdx,
    );
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'CarouselSlideValue')}(word: \u2524$_word\u251C, idx: \u2524$_currentIdx\u251C)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is CarouselSlideValue &&
        other._word == _word &&
        other._currentIdx == _currentIdx;
  }

  @override
  int get hashCode => Object.hash(
        _word,
        _currentIdx,
      );
}
