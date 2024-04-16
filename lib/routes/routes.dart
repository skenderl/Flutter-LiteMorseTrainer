import "package:flutter/material.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/helpers/helpers.dart";
import "package:morse_learn/screens/screens.dart";
import "package:morse_learn/extensions/extensions.dart";

const String _trainingRoutesSuffix = "Training";

enum AppRoutes implements Comparable<AppRoutes> {
  home(
    path: "/",
    screen: HomeScreen(),
  ),
  encode(
    path: "/encode",
    screen: EncodeScreen(),
  ),
  category(
    path: "/category",
    screen: TrainingCategoryListScreen(),
  ),
  settings(
    path: "/settings",
    screen: SettingsScreen(),
  ),
  tutorial(
    path: "/tutorial",
    screen: TutorialCategoryListScreen(),
  ),
  easyTraining(
    path: "/easy$_trainingRoutesSuffix",
    screen: EasyTrainingScreen(),
  ),
  mediumTraining(
    path: "/medium$_trainingRoutesSuffix",
    screen: MediumTrainingScreen(),
  ),
  hardTraining(
    path: "/hard$_trainingRoutesSuffix",
    screen: HardTrainingScreen(),
  ),
  lettersTraining(
    path: "/letters$_trainingRoutesSuffix",
    screen: LettersTrainingScreen(),
  ),
  numbersTraining(
    path: "/numbers$_trainingRoutesSuffix",
    screen: NumbersTrainingScreen(),
  ),
  ;

  const AppRoutes({
    required this.path,
    required this.screen,
  });

  final String path;
  final Widget screen;

  static String getTrainingRoutePath(
    AppTrainingCategory category,
  ) {
    final route = AppRoutes.values.firstWhereOrNull(
      (route) => route.path == "/${category.name}$_trainingRoutesSuffix",
    );

    return route?.path ?? "/404";
  }

  @override
  int compareTo(AppRoutes other) => 0;
}

abstract final class AppRoutesGenerator {
  static Route generateRoute(RouteSettings routeSettings) {
    return FadeRoute(
      builder: (context) => generateScreenFromRoute(routeSettings),
    );
  }

  @visibleForTesting
  static Widget generateScreenFromRoute(RouteSettings routeSettings) {
    final currentRoute = AppRoutes.values
        .firstWhereOrNull((route) => route.path == routeSettings.name);

    if (currentRoute != null) {
      return currentRoute.screen;
    }

    return const ErrorScreen();
  }
}
