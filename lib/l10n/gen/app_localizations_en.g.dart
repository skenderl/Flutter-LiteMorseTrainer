import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Learn Morse Code';

  @override
  String get start => 'Start';

  @override
  String get tutorial => 'Tutorial';

  @override
  String get lettersTutorial => 'Letters';

  @override
  String get numbersTutorial => 'Numbers';

  @override
  String get categoryTitle => 'Select Mode';

  @override
  String get easyCategory => 'Easy';

  @override
  String get mediumCategory => 'Medium';

  @override
  String get hardCategory => 'Hard';

  @override
  String share(String link) {
    return 'Check out our apps: $link';
  }

  @override
  String get settings => 'Settings';

  @override
  String get sound => 'Sound';

  @override
  String get vibration => 'Vibration';

  @override
  String get keyboardInputTimeout => 'Keyboard Input Timeout';

  @override
  String keyboardInputTimeoutValue(Object value) {
    return '$value sec';
  }

  @override
  String get translate => 'Translate';

  @override
  String get textToMorse => 'Text to Morse';

  @override
  String get needHelp => 'Need Help?';

  @override
  String get answer => 'Answer';

  @override
  String rule(Object number) {
    return 'Rule $number';
  }

  @override
  String get codeDecode => 'Code / Decode';

  @override
  String get txtToMorse => 'String to Morse';

  @override
  String get typeYourTxt => 'Type your String';

  @override
  String get copyMorse => 'Copy Morse';

  @override
  String get playMorse => 'Play Morse';

  @override
  String get morseCodeRules => 'Morse Code Rules';

  @override
  String get rule1 => 'The length of a dot is one unit.';

  @override
  String get rule2 => 'A dash is three units.';

  @override
  String get rule3 => 'The space between symbols (dots and dashes) of the same letter is one unit.';

  @override
  String get rule4 => 'The space between letters is three units.';

  @override
  String get rule5 => 'The space between words is seven units.';

  @override
  String get alphabet => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  @override
  String get singleKeyKeyboard => 'Single Key Keyboard';

  @override
  String get language => 'Language';

  @override
  String get pageNotFound => 'Page Not Found!';

  @override
  String get goBack => 'Go back';

  @override
  String get error => 'Error !';
}
