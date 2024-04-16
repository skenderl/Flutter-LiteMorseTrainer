import "dart:async";

import "package:flutter/material.dart";

import "package:morse_learn/extensions/extensions.dart";

import "carousel_slide.dart";

class CarouselSliderController extends ScrollController {
  CarouselSliderController({
    required this.slides,
    int initialSlide = 0,
    this.duration = const Duration(milliseconds: 300),
    this.curve,
  })  : _currentSlideIdx = initialSlide,
        colors = List<Color>.generate(
          slides.length,
          (idx) => ColorExtension.random(),
        ),
        assert(
          initialSlide >= 0,
          initialSlide < slides.length,
        );

  final Duration duration;
  final Curve? curve;
  final List<CarouselSlide> slides;
  final List<Color> colors;
  int _currentSlideIdx;

  CarouselSlide get currentSlide => slides[_currentSlideIdx];
  Color get currentColor => colors[_currentSlideIdx];
  bool get isLastSlide => _currentSlideIdx == slides.length - 1;

  FutureOr<void> next(double scrollOffset) {
    if (!currentSlide.controller.isLastChar) {
      currentSlide.controller.next();
    } else if (_currentSlideIdx < slides.length - 1) {
      _currentSlideIdx++;

      return animateTo(
        offset + scrollOffset,
        curve: curve ?? Curves.linear,
        duration: duration,
      );
    }
  }

  FutureOr<void> previous(double scrollOffset) {
    if (!currentSlide.controller.isFirstChar) {
      currentSlide.controller.previous();
    } else if (_currentSlideIdx != 0) {
      _currentSlideIdx--;

      return animateTo(
        offset - scrollOffset,
        curve: curve ?? Curves.linear,
        duration: duration,
      );
    }
  }
}
