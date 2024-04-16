import "package:flutter/material.dart";

import "package:flutter_animate/flutter_animate.dart";

import "package:morse_learn/helpers/helpers.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ColoredBox(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 120),
                child: Image(
                  image: AssetImage(AssetsImages.icon),
                  fit: BoxFit.contain,
                  height: 160,
                  width: 160,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Image(
                  image: AssetImage(AssetsImages.soloduo),
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                )
                    .animate()
                    .fade(
                      duration: 300.milliseconds,
                      curve: Curves.ease,
                      begin: 0,
                      end: 1,
                    )
                    .scaleXY(
                      duration: 300.milliseconds,
                      curve: Curves.ease,
                      begin: 0,
                      end: 1,
                    )
                    .flip(duration: 600.milliseconds)
                    .shimmer(
                      duration: 600.milliseconds,
                      color: Colors.blue,
                      colors: [
                        Colors.grey,
                        Colors.white,
                        Colors.grey,
                        Colors.white,
                      ],
                    )
                    .slide(
                      duration: 600.milliseconds,
                      begin: const Offset(0, 50),
                      end: Offset.zero,
                    )
                    .shake(
                      delay: 200.milliseconds,
                      duration: 600.milliseconds,
                      hz: 1000,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
