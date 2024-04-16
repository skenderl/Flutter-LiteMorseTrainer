import "package:flutter/material.dart";

class LetterCircle extends StatelessWidget {
  const LetterCircle({
    required this.character, required this.radius, super.key,
    this.textColor = Colors.white,
    this.color,
    this.animated = true,
  });

  final String character;
  final double radius;
  final Color textColor;
  final Color? color;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final child = Center(
      child: FittedBox(
        child: Text(
          character.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: radius * 3,
          ),
        ),
      ),
    );

    if (animated) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: radius,
        height: radius,
        margin: EdgeInsets.symmetric(horizontal: radius / 10),
        padding: EdgeInsets.all(radius / 15),
        decoration: BoxDecoration(
          color: color ?? Colors.black45,
          shape: BoxShape.circle,
        ),
        child: child,
      );
    }

    return Container(
      width: radius,
      height: radius,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? Colors.black45,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(6, 6),
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
