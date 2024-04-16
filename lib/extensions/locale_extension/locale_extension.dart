import "dart:ui";

import "package:morse_learn/l10n/l10n.dart";

import "../app_localizations_extension.dart";

import "./_words_lists/_words_lists.dart";

extension LocaleExtension on Locale {
  AppLocalizations get l10n => this == const Locale("de")
      ? AppLocalizationsDe()
      : this == const Locale("fr")
          ? AppLocalizationsFr()
          : this == const Locale("es")
              ? AppLocalizationsEs()
              : AppLocalizationsEn();

  // String get flag => this == const Locale("de")
  //     ? "🇩🇪"
  //     : this == const Locale("fr")
  //         ? "🇫🇷"
  //         : this == const Locale("es")
  //             ? "🇪🇸"
  //             : "🇺🇸";

  String get flag =>
      (languageCode.toUpperCase() == "EN" ? "US" : languageCode.toUpperCase())
          .replaceAllMapped(
        RegExp("[A-Z]"),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
      );

  String get name =>
      AppLocalizationsExtension.supportedLanguages.keys.firstWhere(
        (currentLanguage) =>
            AppLocalizationsExtension.supportedLanguages[currentLanguage] ==
            this,
      );

  List<String> get wordsList {
    return this == const Locale("de")
        ? germanWordsList
        : this == const Locale("fr")
            ? frenchWordsList
            : this == const Locale("es")
                ? spanishWordsList
                : englishWordsList;
  }
}
