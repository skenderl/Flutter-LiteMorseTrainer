import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/extensions/extensions.dart";

import "./training_screen.dart";

class EasyTrainingScreen extends StatelessWidget {
  const EasyTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items =
        context.watch<AppSettingsProvider?>()?.language.wordsList ?? [];
    final alphabet =
        context.watch<AppSettingsProvider?>()?.language.l10n.alphabet;
    final progressList = alphabet != null
        ? List<String>.generate(
            alphabet.length,
            (idx) => alphabet[idx],
          )
        : null;

    return TrainingScreen(
      items: items,
      progressList: progressList,
      difficulty: TrainingDifficulty.easy,
    );
  }
}
