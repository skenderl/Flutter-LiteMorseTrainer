import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:morse_learn/models/models.dart' show Sentence;
import 'package:morse_learn/common/common.dart' show AppBarDivider;

class CodeDecodeScreen extends StatefulWidget {
  CodeDecodeScreen({Key key}) : super(key: key);

  _CodeDecodeScreenState createState() => _CodeDecodeScreenState();
}

class _CodeDecodeScreenState extends State<CodeDecodeScreen> {
  String textToCode = "";
  AppLocalizations l10n;
  Sentence sentenceToCode;

  List<Widget> getRules() {
    List<Widget> result = List<Widget>();
    for (var i = 0; i < 5; i++) {
      String ruleX = "¯\_(ツ)_/¯";
      switch (i) {
        case 0:
          ruleX = l10n.rule1;
          break;
        case 1:
          ruleX = l10n.rule2;
          break;
        case 2:
          ruleX = l10n.rule3;
          break;
        case 3:
          ruleX = l10n.rule4;
          break;
        case 4:
          ruleX = l10n.rule5;
          break;
      }
      result.add(ListTile(
        title: Text(
          l10n.rule(i + 1),
          style: TextStyle(
            color: Color(0xfff1e4d4),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "$ruleX",
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
    l10n = AppLocalizations.of(context);
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
                  l10n.codeDecode,
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
                        l10n.txtToMorse,
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
                          hintText: l10n.typeYourTxt,
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
                                Text(l10n.copyMorse),
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
                                Text(l10n.playMorse),
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
                        l10n.morseCodeRules,
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
