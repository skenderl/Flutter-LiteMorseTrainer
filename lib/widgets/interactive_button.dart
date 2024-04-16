import "package:flutter/material.dart";

class InteractiveButton extends StatefulWidget {
  const InteractiveButton({
    super.key,
    this.onTap,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.brightness = Brightness.dark,
  });

  final VoidCallback? onTap;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Brightness brightness;

  @override
  State<InteractiveButton> createState() => _InteractiveButtonState();
}

class _InteractiveButtonState extends State<InteractiveButton> {
  bool isPressed = false;

  void onTap() {
    widget.onTap?.call();
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
        height: widget.height,
        width: widget.width,
        padding: widget.padding,
        margin: isPressed
            ? const EdgeInsets.fromLTRB(12, 12, 4, 4)
            : const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.brightness == Brightness.dark
              ? isPressed
                  ? const Color(0xFF314463)
                  : const Color(0xff151e2c)
              : isPressed
                  ? const Color(0xFFFF1B64)
                  : const Color(0xffe01b4d),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: isPressed
              ? null
              : [
                  BoxShadow(
                    color: widget.brightness == Brightness.dark
                        ? Colors.black45
                        : Colors.white10,
                    offset: const Offset(4, 4),
                  ),
                ],
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
