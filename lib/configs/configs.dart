import "package:flutter/painting.dart";

abstract final class Configs {
  static const Locale defaultLanguage = Locale("en");
  static const bool defaultSound = true;
  static const bool defaultVibration = true;
  static const bool defaultSingleKeyKeyboard = false;
  static const int defaultKeyboardTimeout = 1250;
  static const int trainingMaxLength = 248;
}
