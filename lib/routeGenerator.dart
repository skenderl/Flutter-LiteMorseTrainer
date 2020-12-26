import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:morse_learn/screens/screens.dart';
import 'package:morse_learn/common/common.dart'
    show SlideLeftRoute, SlideRightRoute, FadeRoute, SizeRoute;
import 'package:morse_learn/utils/utils.dart'
    show getWordsList, numbers, getLetters;

class RouteGenerator {
  static Route<dynamic> generateRoute(
      RouteSettings settings, AppLocalizations l10n) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/Splash':
        return FadeRoute(page: SplashScreen());
      case '/Home':
        return FadeRoute(page: HomeScreen());
      case '/Category':
        return FadeRoute(
            page: CategoryScreen(
          categories: [
            Category(
              route: "/Easy",
              title: l10n.easyCategory,
              morseTitle: ". .- ... -.--",
            ),
            Category(
              route: "/Medium",
              title: l10n.mediumCategory,
              morseTitle: "-- . -.. .. ..- --",
            ),
            Category(
              route: "/Hard",
              title: l10n.hardCategory,
              morseTitle: ".... .- .-. -..",
            )
          ],
        ));
      case '/Tutorial':
        return FadeRoute(
            page: CategoryScreen(
          categories: [
            Category(
              route: "/LettersTutorial",
              title: l10n.lettersTutorial,
            ),
            Category(
              route: "/NumbersTutorial",
              title: l10n.numbersTutorial,
            ),
          ],
        ));
      case '/Settings':
        return FadeRoute(page: SettingsScreen());
      case '/Easy':
        return SlideRightRoute(
            page: TrainingScreen(
                quizDifficulty: 3,
                quizLength: 10,
                trainingList: getWordsList(l10n.localeName),
                progressList: getLetters(l10n.alphabet)));
      case '/Medium':
        return SlideRightRoute(
            page: TrainingScreen(
                quizDifficulty: 8,
                quizLength: 15,
                trainingList: getWordsList(l10n.localeName),
                progressList: getLetters(l10n.alphabet)));
      case '/Hard':
        return SlideRightRoute(
            page: TrainingScreen(
                quizDifficulty: 10,
                quizLength: 20,
                trainingList: getWordsList(l10n.localeName),
                progressList: getLetters(l10n.alphabet)));
      case '/LettersTutorial':
        return SlideLeftRoute(
            page: TrainingScreen(
                quizDifficulty: 0,
                quizLength: getLetters(l10n.alphabet).length,
                trainingList: getLetters(l10n.alphabet),
                progressList: getLetters(l10n.alphabet)));
      case '/NumbersTutorial':
        return SlideLeftRoute(
            page: TrainingScreen(
                quizDifficulty: 0,
                quizLength: numbers.length,
                trainingList: numbers,
                progressList: numbers));
      case '/CodeDecode':
        return SizeRoute(page: CodeDecodeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
