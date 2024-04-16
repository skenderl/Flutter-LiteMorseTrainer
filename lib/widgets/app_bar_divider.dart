import "package:flutter/material.dart";

const kAppBarHeight = 1.0;

class AppBarDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDivider({
    super.key,
    this.indent = 0.0,
    this.endIndent,
    this.color = Colors.white70,
    this.thickness,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kAppBarHeight);

  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: kAppBarHeight,
      indent: indent,
      endIndent: endIndent,
      color: color,
      thickness: kAppBarHeight,
    );
  }
}
