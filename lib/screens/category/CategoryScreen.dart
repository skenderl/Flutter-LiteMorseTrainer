import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatefulWidget {
  final List<Category> categories;
  CategoryScreen({Key key, @required this.categories}) : super(key: key);

  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                                  l10n.categoryTitle,
                                  style: TextStyle(
                                      color: Color(0xfff1e4d4),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 2000),
                                ),
                              ),
                            ),
                          ),
                          for (final category in widget.categories) ...[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(category.route);
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
                                        category.title,
                                        style: TextStyle(
                                            color: Color(0xfff1e4d4),
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 40),
                                      ),
                                      category.morseTitle != null
                                          ? Text(
                                              category.morseTitle,
                                              style: TextStyle(
                                                  color: Color(0xfff1e4d4),
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 20),
                                            )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
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

class Category {
  Category({
    @required this.route,
    @required this.title,
    this.morseTitle,
  });

  String route;
  String title;
  String morseTitle;
}
