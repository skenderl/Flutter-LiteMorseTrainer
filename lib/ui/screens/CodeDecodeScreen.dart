import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:morse_learn/utils/utils.dart';
import 'package:morse_learn/models/Sentence.dart';

class CodeDecodeScreen extends StatefulWidget {
  CodeDecodeScreen({Key key}) : super(key: key);

  _CodeDecodeScreenState createState() => _CodeDecodeScreenState();
}

class _CodeDecodeScreenState extends State<CodeDecodeScreen> {
  String textToCode = "";
  Sentence sentenceToCode;

  List<Widget> getRules() {
    List<Widget> result = List<Widget>();
    for (var i = 0; i < rules.length; i++) {
      final item = rules[i];
      result.add(ListTile(
        title: Text(
          "Rule ${i + 1} :",
          style: TextStyle(
            color: Color(0xfff1e4d4),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "$item",
          style: TextStyle(
            color: Color(0xaff1e4d4),
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
    }
    return result;
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
              appBar: AppBar(
                bottom: AppBarDivider(),
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "Code / Decode",
                  style: TextStyle(
                    color: Color(0xfff1e4d4),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: Container(
                height: size.height,
                width: size.width,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      enabled: false,
                      title: Text(
                        "Text to Morse:",
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        style: new TextStyle(color: Colors.white),
                        autofocus: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type your text',
                        ),
                        onChanged: (text) {
                          textToCode = text;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FittedBox(
                          child: RaisedButton(
                            onPressed: () {
                              sentenceToCode = Sentence(textToCode);
                              Clipboard.setData(ClipboardData(
                                  text: '${sentenceToCode.toString()}'));
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.content_copy),
                                Text("Copy Morse"),
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: RaisedButton(
                            onPressed: () {
                              sentenceToCode = Sentence(textToCode);
                              sentenceToCode.playSentence();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.play_arrow),
                                Text("Play Morse"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      enabled: false,
                      title: Text(
                        "Morse Code Rules:",
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]..addAll(getRules()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarDivider extends Divider implements PreferredSizeWidget {
  AppBarDivider({
    Key key,
    height = 16.0,
    indent = 20.0,
    endIndent,
    color = Colors.white,
  })  : assert(height >= 0.0),
        super(
          key: key,
          height: height,
          indent: indent,
          endIndent: indent,
          color: color,
        ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}
