import 'dart:async';
import 'package:flutter/material.dart';
import 'package:morse_learn/main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  _prefsInit() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('silent')) {
      await prefs.setBool('silent', false);
    }
    if (!prefs.containsKey('vibration')) {
      await prefs.setBool('vibration', true);
    }
    if (!prefs.containsKey('timeOut')) {
      await prefs.setInt('timeOut', 1250);
    }
    if (!prefs.containsKey('isSingleKeyKeyboard')) {
      await prefs.setBool('isSingleKeyKeyboard', false);
    }
    if (prefs.containsKey('languageCode')) {
      MorseApp.setLocale(context, Locale(prefs.getString('languageCode')));
    }
  }

  void initState() {
    super.initState();
    _prefsInit().then((value) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: FlareActor(
            "assets/flares/soloduo_splash.flr",
            animation: "animate",
            fit: BoxFit.cover,
          ),
        ));
  }
}
