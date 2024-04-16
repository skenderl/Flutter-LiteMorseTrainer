import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/providers/providers.dart";

import "./category_list.dart";

class TutorialCategoryListScreen extends StatelessWidget {
  const TutorialCategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryListScreen(
      categories: [
        Category(
          route: AppTrainingCategory.letters,
          title: context.watch<AppSettingsProvider?>()?.l10n.lettersTutorial,
        ),
        Category(
          route: AppTrainingCategory.numbers,
          title: context.watch<AppSettingsProvider?>()?.l10n.numbersTutorial,
        ),
      ],
    );
  }
}
