import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/providers/providers.dart";

import "./category_list.dart";

class TrainingCategoryListScreen extends StatelessWidget {
  const TrainingCategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryListScreen(
      categories: [
        Category(
          route: AppTrainingCategory.easy,
          title: context.watch<AppSettingsProvider?>()?.l10n.easyCategory,
        ),
        Category(
          route: AppTrainingCategory.medium,
          title: context.watch<AppSettingsProvider?>()?.l10n.mediumCategory,
        ),
        Category(
          route: AppTrainingCategory.hard,
          title: context.watch<AppSettingsProvider?>()?.l10n.hardCategory,
        ),
      ],
    );
  }
}
