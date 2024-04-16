import "package:flutter/material.dart";

import "./morse_dot_unit.dart";

class MorseDashUnit extends StatelessWidget {
  const MorseDashUnit({
    super.key,
    this.hint,
  });

  final bool? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: hint ?? false ? kUnitHeight * 2.5 + 1 : kUnitHeight * 2.5,
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
