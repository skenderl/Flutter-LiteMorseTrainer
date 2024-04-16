import "package:flutter/material.dart";

import "./carousel_slider_controller.dart";

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    required this.controller, super.key,
  });

  final CarouselSliderController controller;

  CarouselSlider copyWith({
    Key? key,
    int? current,
    CarouselSliderController? controller,
  }) {
    return CarouselSlider(
      key: key ?? this.key,
      controller: controller ?? this.controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller,
      child: Row(
        children: controller.slides,
      ),
    );
  }
}
