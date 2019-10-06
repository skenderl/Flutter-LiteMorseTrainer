import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key}) : super(key: key);

  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                                  "Select Mode:",
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
                              Navigator.of(context).pushNamed('/Easy');
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                color: Color(0xff262da7),
                              ),
                              padding: EdgeInsets.all(20.0),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Easy",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      ". .- ... -.--",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/Medium');
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                color: Color(0xff262da7),
                              ),
                              padding: EdgeInsets.all(30.0),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Medium",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      "-- . -.. .. ..- --",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/Hard');
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                color: Color(0xff262da7),
                              ),
                              padding: EdgeInsets.all(20.0),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Hard",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      ".... .- .-. -..",
                                      style: TextStyle(
                                          color: Color(0xfff1e4d4),
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
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
