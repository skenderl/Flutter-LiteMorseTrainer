import "package:flutter/material.dart";

import "package:morse_learn/types/types.dart";
import "package:morse_learn/models/models.dart";

import "./morse_editing_controller.dart";

class SingleKeyKeyboard extends StatefulWidget {
  const SingleKeyKeyboard({
    super.key,
    this.controller,
    this.onTap,
  });

  final MorseEditingController? controller;
  final CharacterUnitCallback? onTap;

  @override
  State<SingleKeyKeyboard> createState() => _SingleKeyKeyboardState();
}

class _SingleKeyKeyboardState extends State<SingleKeyKeyboard> {
  bool isPressed = false;

  void onDash() {
    widget.controller?.add(MorseUnit.dash);
    widget.onTap?.call(MorseUnit.dash);
  }

  void onDot() {
    widget.controller?.add(MorseUnit.dot);
    widget.onTap?.call(MorseUnit.dot);
  }

  void onTapDown([dynamic _]) {
    setState(() {
      isPressed = true;
    });
  }

  void onTapUp([dynamic _]) {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapUp,
        onDoubleTap: onDash,
        onLongPress: onDash,
        onTap: onDot,
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 300),
          margin: isPressed
              ? const EdgeInsets.fromLTRB(24, 24, 8, 8)
              : const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                isPressed ? const Color(0xFF314463) : const Color(0xff151e2c),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: isPressed
                ? null
                : [
                    const BoxShadow(
                      color: Colors.black45,
                      offset: Offset(4, 4),
                    ),
                  ],
          ),
          child: FittedBox(
            child: CustomPaint(
              size: Size.square(MediaQuery.of(context).size.shortestSide),
              painter: DoubleKeyPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class DoubleKeyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outerPath = Path();
    final innerPath = Path();

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    outerPath.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width * 0.2,
      ),
    );
    canvas.drawPath(outerPath, paint);

    innerPath.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width * 0.15,
      ),
    );
    canvas.drawPath(innerPath, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
