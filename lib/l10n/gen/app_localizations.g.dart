import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.g.dart';
import 'app_localizations_en.g.dart';
import 'app_localizations_es.g.dart';
import 'app_localizations_fr.g.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Learn Morse Code'**
  String get title;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @tutorial.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorial;

  /// No description provided for @lettersTutorial.
  ///
  /// In en, this message translates to:
  /// **'Letters'**
  String get lettersTutorial;

  /// No description provided for @numbersTutorial.
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get numbersTutorial;

  /// No description provided for @categoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Mode'**
  String get categoryTitle;

  /// No description provided for @easyCategory.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easyCategory;

  /// No description provided for @mediumCategory.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get mediumCategory;

  /// No description provided for @hardCategory.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hardCategory;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Check out our apps: {link}'**
  String share(String link);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @keyboardInputTimeout.
  ///
  /// In en, this message translates to:
  /// **'Keyboard Input Timeout'**
  String get keyboardInputTimeout;

  /// No description provided for @keyboardInputTimeoutValue.
  ///
  /// In en, this message translates to:
  /// **'{value} sec'**
  String keyboardInputTimeoutValue(Object value);

  /// No description provided for @translate.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// No description provided for @textToMorse.
  ///
  /// In en, this message translates to:
  /// **'Text to Morse'**
  String get textToMorse;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get needHelp;

  /// No description provided for @answer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answer;

  /// No description provided for @rule.
  ///
  /// In en, this message translates to:
  /// **'Rule {number}'**
  String rule(Object number);

  /// No description provided for @codeDecode.
  ///
  /// In en, this message translates to:
  /// **'Code / Decode'**
  String get codeDecode;

  /// No description provided for @txtToMorse.
  ///
  /// In en, this message translates to:
  /// **'String to Morse'**
  String get txtToMorse;

  /// No description provided for @typeYourTxt.
  ///
  /// In en, this message translates to:
  /// **'Type your String'**
  String get typeYourTxt;

  /// No description provided for @copyMorse.
  ///
  /// In en, this message translates to:
  /// **'Copy Morse'**
  String get copyMorse;

  /// No description provided for @playMorse.
  ///
  /// In en, this message translates to:
  /// **'Play Morse'**
  String get playMorse;

  /// No description provided for @morseCodeRules.
  ///
  /// In en, this message translates to:
  /// **'Morse Code Rules'**
  String get morseCodeRules;

  /// No description provided for @rule1.
  ///
  /// In en, this message translates to:
  /// **'The length of a dot is one unit.'**
  String get rule1;

  /// No description provided for @rule2.
  ///
  /// In en, this message translates to:
  /// **'A dash is three units.'**
  String get rule2;

  /// No description provided for @rule3.
  ///
  /// In en, this message translates to:
  /// **'The space between symbols (dots and dashes) of the same letter is one unit.'**
  String get rule3;

  /// No description provided for @rule4.
  ///
  /// In en, this message translates to:
  /// **'The space between letters is three units.'**
  String get rule4;

  /// No description provided for @rule5.
  ///
  /// In en, this message translates to:
  /// **'The space between words is seven units.'**
  String get rule5;

  /// No description provided for @alphabet.
  ///
  /// In en, this message translates to:
  /// **'ABCDEFGHIJKLMNOPQRSTUVWXYZ'**
  String get alphabet;

  /// No description provided for @singleKeyKeyboard.
  ///
  /// In en, this message translates to:
  /// **'Single Key Keyboard'**
  String get singleKeyKeyboard;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found!'**
  String get pageNotFound;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error !'**
  String get error;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
