import "package:flutter/material.dart";

import "./training_screen.dart";

class NumbersTrainingScreen extends StatelessWidget {
  const NumbersTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(
      10,
      (idx) => idx.toString(),
    );

    return TrainingScreen(
      items: items,
      progressList: items,
      difficulty: TrainingDifficulty.tutorial,
    );
  }
}
