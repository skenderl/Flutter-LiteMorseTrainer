import 'package:flutter/material.dart';

class TutorialCategoryScreen extends StatefulWidget {
  TutorialCategoryScreen({Key key}) : super(key: key);

  _TutorialCategoryScreenState createState() => _TutorialCategoryScreenState();
}

class _TutorialCategoryScreenState extends State<TutorialCategoryScreen> {
  void initState() {
    super.initState();
  }

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
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: size.height * 0.1,
                            width: size.width * 0.8,
                            child: FittedBox(
                              child: Center(
                                child: Text(
                                  "Select Tutorial:",
                                  style: TextStyle(
                                      color: Color(0xfff1e4d4),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 2000),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/LettersTutorial');
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Color(0xff262da7),
                              ),
                              padding: EdgeInsets.all(30.0),
                              child: FittedBox(
                                child: Text(
                                  "Letters",
                                  style: TextStyle(
                                      color: Color(0xfff1e4d4),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/NumbersTutorial');
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Color(0xff262da7),
                              ),
                              padding: EdgeInsets.all(30.0),
                              child: FittedBox(
                                child: Text(
                                  "Numbers",
                                  style: TextStyle(
                                      color: Color(0xfff1e4d4),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
