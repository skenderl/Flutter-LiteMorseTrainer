import "dart:async";
import "dart:math";

import "package:flutter/material.dart";
import "package:morse_learn/routes/routes.dart";
import "package:morse_learn/widgets/widgets.dart";

import "package:provider/provider.dart";
import "package:share_plus/share_plus.dart";

import "package:morse_learn/providers/providers.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final buttonPadding = min(
      30.0,
      max(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ) *
          0.015,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151e2c),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const HomeScreenTitle(),
                  ),
                  const Spacer(),
                  InteractiveButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.category.path);
                    },
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.all(buttonPadding),
                    brightness: Brightness.light,
                    child: FittedBox(
                      child: Text(
                        context.watch<AppSettingsProvider?>()?.l10n.start ??
                            "_start",
                        style: TextStyle(
                          color: const Color(0xfff1e4d4),
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InteractiveButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.tutorial.path);
                    },
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.all(buttonPadding),
                    brightness: Brightness.light,
                    child: FittedBox(
                      child: Text(
                        context.watch<AppSettingsProvider?>()?.l10n.tutorial ??
                            "_tutorial_",
                        style: TextStyle(
                          color: const Color(0xfff1e4d4),
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.settings),
                        tooltip: "Settings",
                        color: const Color(0xfff1e4d4),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.settings.path,
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: "Share",
                        color: const Color(0xfff1e4d4),
                        onPressed: () => Share.share(
                          context.read<AppSettingsProvider?>()?.l10n.share(
                                    "https://play.google.com/store/apps/developer?id=Solo%7CDuo",
                                  ) ??
                              "_url_",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenTitle extends StatefulWidget {
  const HomeScreenTitle({super.key});

  @override
  State<HomeScreenTitle> createState() => _HomeScreenTitleState();
}

class _HomeScreenTitleState extends State<HomeScreenTitle> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
          Timer(const Duration(milliseconds: 300), () {
            setState(() {
              isTapped = !isTapped;
            });
          });
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isTapped
                ? MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.45,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isTapped ? const Color(0xff151e2c) : const Color(0xffe01b4d),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.5,
            child: const FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      "Lite",
                      style: TextStyle(
                        color: Color(0xfff1e4d4),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 400,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Morse",
                      style: TextStyle(
                        color: Color(0xfff1e4d4),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 400,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Trainer",
                      style: TextStyle(
                        color: Color(0xfff1e4d4),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
