import "package:flutter/foundation.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/extensions/extensions.dart";

class MorseEditingController extends ValueNotifier<MorseEditingValue> {
  MorseEditingController({
    List<MorseUnit>? units,
  }) : super(
          units == null
              ? MorseEditingValue.empty
              : MorseEditingValue(units: units),
        );

  List<MorseUnit> get units => value._units;

  MorseUnit? unitAt(int idx) {
    return value._units.elementAtOrNull(idx);
  }

  void add(MorseUnit unit) {
    value = value.copyWith(
      units: [
        ...value._units,
        unit,
      ],
    );

    notifyListeners();
  }

  void clear() {
    value = MorseEditingValue.empty;

    notifyListeners();
  }
}

@immutable
class MorseEditingValue {
  MorseEditingValue({
    List<MorseUnit>? units,
  }) : _units = units ?? List.empty(growable: true);

  final List<MorseUnit> _units;

  List<MorseUnit> get units => _units;

  static MorseEditingValue empty = MorseEditingValue();

  MorseEditingValue copyWith({
    List<MorseUnit>? units,
  }) {
    return MorseEditingValue(
      units: units ?? _units,
    );
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'MorseEditingValue')}(units: \u2524$_units\u251C)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is MorseEditingValue &&
        other._units == _units &&
        _units.equals(other._units);
  }

  @override
  int get hashCode => _units.hashCode;
}
