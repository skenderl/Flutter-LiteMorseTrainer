import 'package:flutter/material.dart';

import 'package:morse_learn/ui/widgets/MorseSlide.dart';

class MorseSlider extends StatefulWidget {
  MorseSlider({Key key, this.slides, this.currentSlide})
      : _controller = ScrollController(),
      super(key: key);

  ScrollController get sliderController => _controller;
  List<MorseSlide> get sliderSlides => slides;
  set slideCurrent(int current){
    currentSlide = current;
  }
  int get slideCurrent => currentSlide;

  final ScrollController _controller;
  final List<MorseSlide> slides;
  int currentSlide;

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
