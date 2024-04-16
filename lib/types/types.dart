import "package:flutter/widgets.dart";

import "package:morse_learn/models/models.dart";

typedef BuildContextCallback<T> = T Function(BuildContext);
typedef CharacterUnitCallback = void Function(MorseUnit);
typedef StringCallback = void Function(String);
typedef BoolCallback = void Function(bool);
typedef IntCallback = void Function(int);
