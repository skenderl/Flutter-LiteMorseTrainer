import 'app_localizations.g.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get title => 'Lerne Morsecode';

  @override
  String get start => 'Start';

  @override
  String get tutorial => 'Lernprogramm';

  @override
  String get lettersTutorial => 'Briefe';

  @override
  String get numbersTutorial => 'Zahlen';

  @override
  String get categoryTitle => 'Auswahlmodus';

  @override
  String get easyCategory => 'Einfach';

  @override
  String get mediumCategory => 'Mittel';

  @override
  String get hardCategory => 'Schwer';

  @override
  String share(String link) {
    return 'Schauen Sie sich unsere Apps an: $link';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get sound => 'Ton';

  @override
  String get vibration => 'Vibration';

  @override
  String get keyboardInputTimeout => 'Zeitlimit für Tastatureingabe';

  @override
  String keyboardInputTimeoutValue(Object value) {
    return '$value sek';
  }

  @override
  String get translate => 'Übersetzen';

  @override
  String get textToMorse => 'Text zum Morsen';

  @override
  String get needHelp => 'Brauchen Sie Hilfe?';

  @override
  String get answer => 'Antworten';

  @override
  String rule(Object number) {
    return 'Regel $number';
  }

  @override
  String get codeDecode => 'Code / Decodieren';

  @override
  String get txtToMorse => 'String zu Morse';

  @override
  String get typeYourTxt => 'Tippe deinen String';

  @override
  String get copyMorse => 'Kopieren Sie Morse';

  @override
  String get playMorse => 'Spielen Sie Morse';

  @override
  String get morseCodeRules => 'Morsecode-Regeln';

  @override
  String get rule1 => 'Die Länge eines Punktes beträgt eine Einheit.';

  @override
  String get rule2 => 'Ein Bindestrich besteht aus drei Einheiten.';

  @override
  String get rule3 => 'Der Abstand zwischen Symbolen (Punkten und Strichen) desselben Buchstabens beträgt eine Einheit.';

  @override
  String get rule4 => 'Der Abstand zwischen den Buchstaben beträgt drei Einheiten.';

  @override
  String get rule5 => 'Der Abstand zwischen den Wörtern beträgt sieben Einheiten.';

  @override
  String get alphabet => 'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜß';

  @override
  String get singleKeyKeyboard => 'Einzeltastatur';

  @override
  String get language => 'Sprache';

  @override
  String get pageNotFound => 'Seite nicht gefunden!';

  @override
  String get goBack => 'Geh zurück';

  @override
  String get error => 'Fehler !';
}
