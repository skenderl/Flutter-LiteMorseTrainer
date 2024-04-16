import "dart:math";

import "package:flutter/painting.dart";

const List<Color> _kSlidesColors = [
  Color(0xff007FFF),
  Color(0xff89CFF0),
  Color(0xff0000FF),
  Color(0xffFF7F50),
  Color(0xffDC143C),
  Color(0xff00ffe8),
  Color(0xfff42069),
  Color(0xff5f54df),
];

extension ColorExtension on Color {
  Color get invert =>
      withRed(255 - red).withGreen(255 - green).withBlue(255 - blue);

  Color get darken {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - 0.2).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color get lighten {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + 0.2).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static Color random([int? hash]) {
    final rHash = hash ?? Random().nextInt(_kSlidesColors.length * 10);

    return _kSlidesColors[rHash % _kSlidesColors.length];
  }
}
