import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarDivider extends Divider implements PreferredSizeWidget {
  AppBarDivider({
    Key key,
    height = 16.0,
    indent = 20.0,
    endIndent,
    color = Colors.white,
  })  : assert(height >= 0.0),
        super(
          key: key,
          height: height,
          indent: indent,
          endIndent: indent,
          color: color,
        ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}
