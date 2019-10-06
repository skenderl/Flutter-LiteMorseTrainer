import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:morse_learn/routeGenerator.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(MorseApp());
}

class MorseApp extends StatefulWidget {
  @override
  _MorseAppState createState() => _MorseAppState();
}

class _MorseAppState extends State<MorseApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Morse Code',
      initialRoute: '/Splash',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
