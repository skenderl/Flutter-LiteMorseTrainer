import 'package:flutter/material.dart';
import 'dart:async';

import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool circleSize = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffb06ab3), Color(0xff4568DC)],
                ),
              ),
              height: size.height,
              width: size.width,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            circleSize = !circleSize;
                            Timer(Duration(milliseconds: 200), () {
                              setState(() {
                                circleSize = !circleSize;
                              });
                            });
                          });
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: size.width,
                          height: size.height * 0.5,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    width: circleSize
                                        ? size.width * 0.9
                                        : size.width * 0.2,
                                    height: size.height * 0.5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff20278f),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.95,
                                    height: size.height * 0.5,
                                    child: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FittedBox(
                                            child: Text(
                                              "Lite",
                                              style: TextStyle(
                                                  color: Color(0xfff1e4d4),
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 400),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Morse",
                                              style: TextStyle(
                                                  color: Color(0xfff1e4d4),
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 400),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Trainer",
                                              style: TextStyle(
                                                  color: Color(0xfff1e4d4),
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Category');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.15,
                          padding: EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xff262da7),
                            borderRadius: new BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: FittedBox(
                            child: Text(
                              "Start",
                              style: TextStyle(
                                color: Color(0xfff1e4d4),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Tutorial');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.15,
                          padding: EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xff262da7),
                            borderRadius: new BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: FittedBox(
                            child: Text(
                              "Tutorial",
                              style: TextStyle(
                                color: Color(0xfff1e4d4),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: size.width * 0.8,
                        height: size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.settings),
                              tooltip: 'Settings',
                              color: Color(0xfff1e4d4),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/Settings');
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              tooltip: 'Share',
                              color: Color(0xfff1e4d4),
                              onPressed: () {
                                Share.share(
                                    'Check out our apps: https://play.google.com/store/apps/developer?id=Solo%7CDuo');
                              },
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
