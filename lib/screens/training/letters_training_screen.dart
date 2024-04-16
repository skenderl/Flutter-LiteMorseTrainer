import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/extensions/extensions.dart";

import "./training_screen.dart";

class LettersTrainingScreen extends StatelessWidget {
  const LettersTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<AppSettingsProvider?>()?.l10n.letters ?? [];
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
      difficulty: TrainingDifficulty.tutorial,
    );
  }
}
