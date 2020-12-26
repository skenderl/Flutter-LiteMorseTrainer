import 'package:flutter/material.dart';

import './LetterCircle.dart';

class LettersProgress extends StatelessWidget {
  const LettersProgress(
      {Key key,
      this.color = Colors.black,
      this.width = 0,
      this.height = 0,
      this.circlesMap})
      : super(key: key);

  final Color color;
  final double width;
  final double height;
  final Map<String, bool> circlesMap;

  List<LetterCircle> get circles {
    List<LetterCircle> result = List<LetterCircle>();
    LetterCircle circle;

    circlesMap.forEach((k, v) {
      circle = LetterCircle(
        character: k,
        radius: 300,
        color: v ? Colors.black : Colors.black12,
      );
      result.add(circle);
    });
    return result;
  }

  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      padding: EdgeInsets.all(3),
      child: circlesMap != null
          ? FittedBox(
              child: Row(
                children: this.circles,
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
