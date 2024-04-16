import "package:flutter/material.dart";

import "./letter_circle.dart";

class LettersProgress extends StatelessWidget {
  const LettersProgress({
    super.key,
    this.color = Colors.black,
    this.width = 0,
    this.circlesMap,
  });

  final Color color;
  final double width;
  final Map<String, bool>? circlesMap;

  @override
  Widget build(BuildContext context) {
    if (circlesMap == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SizedBox(
        width: width,
        child: circlesMap!.entries.length > 10 &&
                MediaQuery.of(context).size.width <
                    MediaQuery.of(context).size.height
            ? Column(
                children: [
                  _LettersProgressRow(
                    circlesMap: {
                      for (final entry in circlesMap!.entries
                          .toList()
                          .sublist(0, circlesMap!.entries.length ~/ 2))
                        entry.key: entry.value,
                    },
                  ),
                  const SizedBox(height: 5),
                  _LettersProgressRow(
                    circlesMap: {
                      for (final entry in circlesMap!.entries.toList().sublist(
                          circlesMap!.entries.length ~/ 2 + 1,
                          circlesMap!.entries.length,))
                        entry.key: entry.value,
                    },
                  ),
                ],
              )
            : _LettersProgressRow(
                circlesMap: circlesMap!,
              ),
      ),
    );
  }
}

class _LettersProgressRow extends StatelessWidget {
  const _LettersProgressRow({
    required this.circlesMap,
  });

  final Map<String, bool> circlesMap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: circlesMap.entries
            .map(
              (circle) => LetterCircle(
                character: circle.key,
                radius: MediaQuery.of(context).size.height * 0.05,
                color: circle.value ? Colors.black : Colors.black12,
              ),
            )
            .toList(),
      ),
    );
  }
}
