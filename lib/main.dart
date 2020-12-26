import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import 'package:morse_learn/routeGenerator.dart' show RouteGenerator;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Services.SystemChrome.setPreferredOrientations([
    Services.DeviceOrientation.portraitUp,
    Services.DeviceOrientation.portraitDown
  ]);
  return runApp(MorseApp());
}

class MorseApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MorseAppState state = context.findAncestorStateOfType<_MorseAppState>();
    state.changeLanguage(newLocale);
  }

  @override
  _MorseAppState createState() => _MorseAppState();
}

class _MorseAppState extends State<MorseApp> {
  Locale _locale;
  AppLocalizations l10n;

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return locale;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) {
        l10n = AppLocalizations.of(context);
        return l10n.title;
      },
      initialRoute: '/Splash',
      onGenerateRoute: (RouteSettings settings) =>
          RouteGenerator.generateRoute(settings, l10n),
      debugShowCheckedModeBanner: false,
    );
  }
}
