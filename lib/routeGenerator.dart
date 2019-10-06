import 'package:flutter/material.dart';
import 'package:morse_learn/ui/Transitions.dart';

import 'package:morse_learn/ui/screens/SplashScreen.dart';
import 'package:morse_learn/ui/screens/HomeScreen.dart';
import 'package:morse_learn/ui/screens/CategoryScreen.dart';
import 'package:morse_learn/ui/screens/TutorialCategoryScreen.dart';
import 'package:morse_learn/ui/screens/SettingsScreen.dart';

import 'package:morse_learn/ui/screens/modes/EasyMode.dart';
import 'package:morse_learn/ui/screens/modes/MediumMode.dart';
import 'package:morse_learn/ui/screens/modes/HardMode.dart';

import 'package:morse_learn/ui/screens/tutorials/LettersTutorial.dart';
import 'package:morse_learn/ui/screens/tutorials/NumbersTutorial.dart';

import 'package:morse_learn/ui/screens/CodeDecodeScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/Splash':
        return SlideRightRoute(page: SplashScreen());
      case '/Home':
        return FadeRoute(page: HomeScreen());
      case '/Category':
        return FadeRoute(page: CategoryScreen());
      case '/Tutorial':
        return FadeRoute(page: TutorialCategoryScreen());
      case '/Settings':
        return FadeRoute(page: SettingsScreen());
      case '/Easy':
        return SlideRightRoute(page: EasyMode());
      case '/Medium':
        return SlideRightRoute(page: MediumMode());
      case '/Hard':
        return SlideRightRoute(page: HardMode());
      case '/LettersTutorial':
        return SlideLeftRoute(page: LettersTutorial());
      case '/NumbersTutorial':
        return SlideLeftRoute(page: NumbersTutorial());
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
