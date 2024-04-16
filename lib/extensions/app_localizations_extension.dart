import "dart:ui";

import "package:morse_learn/l10n/l10n.dart";

extension AppLocalizationsExtension on AppLocalizations {
  static const Map<String, Locale> supportedLanguages = <String, Locale>{
    "English": Locale("en"),
    "Deutsch": Locale("de"),
    "Français": Locale("fr"),
    "Español": Locale("es"),
  };

  List<String> get letters => List<String>.generate(
        alphabet.length,
        (idx) => alphabet[idx],
      );
}
