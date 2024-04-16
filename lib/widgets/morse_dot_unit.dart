import "package:flutter/material.dart";

const double kUnitHeight = 15.0;

class MorseDotUnit extends StatelessWidget {
  const MorseDotUnit({
    super.key,
    this.hint,
  });

  final bool? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: hint ?? false ? kUnitHeight + 1 : kUnitHeight,
      height: hint ?? false ? kUnitHeight + 1 : kUnitHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        border: hint ?? false
            ? Border.all(
                color: const Color(0xfff1e4d4),
              )
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    );
  }
}
