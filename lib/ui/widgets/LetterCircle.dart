import 'package:flutter/material.dart';

class LetterCircle extends StatelessWidget {
  const LetterCircle(
      {Key key, this.color = Colors.black45, this.textColor = Colors.white, this.character, this.radius})
      : super(key: key);

  final Color color;
  final String character;
  final double radius;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: radius,
      height: radius,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Container(
        padding: const EdgeInsets.all(20),
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              character.toUpperCase(),
              style: TextStyle(
                color: textColor,
                fontSize: radius * 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
