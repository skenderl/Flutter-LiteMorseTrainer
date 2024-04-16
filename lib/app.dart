import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/l10n/l10n.dart";
import "package:morse_learn/routes/routes.dart";
import "package:morse_learn/providers/providers.dart";

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.watch<AppSettingsProvider?>()?.language,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: context.watch<AppSettingsProvider?>() != null
          ? (context) => context.watch<AppSettingsProvider?>()!.l10n.title
          : null,
      onGenerateRoute: AppRoutesGenerator.generateRoute,
    );
  }

  @override
  void dispose() {
    context.watch<AppSettingsProvider?>()?.dispose();

    super.dispose();
  }
}
