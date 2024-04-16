import 'app_localizations.g.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get title => 'Apprenez le code Morse';

  @override
  String get start => 'Commencer';

  @override
  String get tutorial => 'Tutoriel';

  @override
  String get lettersTutorial => 'Lettres';

  @override
  String get numbersTutorial => 'Nombres';

  @override
  String get categoryTitle => 'Sélectionnez le mode';

  @override
  String get easyCategory => 'Facile';

  @override
  String get mediumCategory => 'Moyen';

  @override
  String get hardCategory => 'Difficile';

  @override
  String share(String link) {
    return 'Découvrez nos applications: $link';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get sound => 'Son';

  @override
  String get vibration => 'Vibration';

  @override
  String get keyboardInputTimeout => 'Délai d\'entrée au clavier';

  @override
  String keyboardInputTimeoutValue(Object value) {
    return '$value sec';
  }

  @override
  String get translate => 'Traduire';

  @override
  String get textToMorse => 'Texte en Morse';

  @override
  String get needHelp => 'Besoin d\'aide?';

  @override
  String get answer => 'Réponse';

  @override
  String rule(Object number) {
    return 'Règle $number';
  }

  @override
  String get codeDecode => 'Codage / Décodage';

  @override
  String get txtToMorse => 'Stringe en morse';

  @override
  String get typeYourTxt => 'Tapez votre Stringe';

  @override
  String get copyMorse => 'Copier Morse';

  @override
  String get playMorse => 'Jouez le Morse';

  @override
  String get morseCodeRules => 'Règles du code Morse';

  @override
  String get rule1 => 'La longueur d\'un point est d\'une unité.';

  @override
  String get rule2 => 'Un tiret correspond à trois unités.';

  @override
  String get rule3 => 'L\'espace entre les symboles (points et tirets) d\'une même lettre est d\'une unité.';

  @override
  String get rule4 => 'L\'espace entre les lettres est de trois unités.';

  @override
  String get rule5 => 'L\'espace entre les mots est de sept unités.';

  @override
  String get alphabet => 'ABCDEFGHIJKLMNOPQRSTUVWXYZÇÜÂÀÊËÈÎÉÆÔÛÙ';

  @override
  String get singleKeyKeyboard => 'Clavier à une seule touche';

  @override
  String get language => 'Langue';

  @override
  String get pageNotFound => 'Page non trouvée!';

  @override
  String get goBack => 'Retourner';

  @override
  String get error => 'Erreur !';
}
