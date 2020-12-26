import 'package:flutter/material.dart';
import './words.dart';

List<String> getWordsList(String localeName) {
  final String french = Locale('fr').toLanguageTag();
  final String spanish = Locale('es').toLanguageTag();
  final String german = Locale('de').toLanguageTag();
  if (localeName == german) {
    return germanWords;
  } else if (localeName == spanish) {
    return spanishWords;
  } else if (localeName == french) {
    return frenchWords;
  } else {
    return englishWords;
  }
}
