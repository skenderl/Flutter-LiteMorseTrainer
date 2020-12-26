import 'package:flutter/material.dart';

import './MorseSlide.dart';

class MorseSlider extends StatefulWidget {
  MorseSlider({Key key, this.slides, this.currentSlide})
      : _controller = ScrollController(),
        super(key: key);

  ScrollController get sliderController => _controller;
  List<MorseSlide> get sliderSlides => slides;
  int get slideCurrent => currentSlide;

  final ScrollController _controller;
  final List<MorseSlide> slides;
  final int currentSlide;

  MorseSlider copyWith({Key key, List<MorseSlide> slides, int currentSlide}) {
    return MorseSlider(
      currentSlide: currentSlide ?? this.currentSlide,
      slides: slides ?? this.slides,
      key: key ?? this.key,
    );
  }

  _MorseSliderState createState() => _MorseSliderState();
}

class _MorseSliderState extends State<MorseSlider> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: widget._controller,
      child: Row(
        children: widget.slides,
      ),
    );
  }
}
