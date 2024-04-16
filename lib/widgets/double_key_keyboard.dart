import "package:flutter/material.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/types/types.dart";

import "./morse_editing_controller.dart";

class DoubleKeyKeyboard extends StatelessWidget {
  const DoubleKeyKeyboard({
    super.key,
    this.controller,
    this.onTap,
  });

  final MorseEditingController? controller;
  final CharacterUnitCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: DoubleKeyKeyboardDotKey(
              controller: controller,
              onTap: onTap,
            ),
          ),
          Expanded(
            child: DoubleKeyKeyboardDashKey(
              controller: controller,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class DoubleKeyKeyboardDotKey extends StatefulWidget {
  const DoubleKeyKeyboardDotKey({
    super.key,
    this.controller,
    this.onTap,
  });

  final MorseEditingController? controller;
  final CharacterUnitCallback? onTap;

  @override
  State<DoubleKeyKeyboardDotKey> createState() =>
      _DoubleKeyKeyboardDotKeyState();
}

class _DoubleKeyKeyboardDotKeyState extends State<DoubleKeyKeyboardDotKey> {
  bool isPressed = false;

  void onTap() {
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
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: isPressed
            ? const EdgeInsets.fromLTRB(12, 12, 4, 4)
            : const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isPressed ? const Color(0xFF314463) : const Color(0xff151e2c),
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
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DoubleKeyKeyboardDashKey extends StatefulWidget {
  const DoubleKeyKeyboardDashKey({
    super.key,
    this.controller,
    this.onTap,
  });

  final MorseEditingController? controller;
  final CharacterUnitCallback? onTap;

  @override
  State<DoubleKeyKeyboardDashKey> createState() =>
      _DoubleKeyKeyboardDashKeyState();
}

class _DoubleKeyKeyboardDashKeyState extends State<DoubleKeyKeyboardDashKey> {
  bool isPressed = false;

  void onTap() {
    widget.controller?.add(MorseUnit.dash);
    widget.onTap?.call(MorseUnit.dash);
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
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: isPressed
            ? const EdgeInsets.fromLTRB(12, 12, 4, 4)
            : const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isPressed ? const Color(0xFF314463) : const Color(0xff151e2c),
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
        child: Center(
          child: Container(
            width: 120,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
