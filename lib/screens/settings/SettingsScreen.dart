import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morse_learn/main.dart';
import 'package:morse_learn/utils/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:morse_learn/common/common.dart' show AppBarDivider;

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double timeOut = 1.25;
  SharedPreferences prefs;
  bool silent = false;
  bool vibration = true;
  bool isSingleKeyKeyboard = false;
  String language;
  Key languageListKey = Key("0");
  bool languageListExpanded = false;

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      silent = prefs.getBool('silent');
      timeOut = prefs.getInt('timeOut') / 1000;
      vibration = prefs.getBool('vibration');
      isSingleKeyKeyboard = prefs.getBool('isSingleKeyKeyboard');
      language = prefs.getString('languageCode');
    });
  }

  void initState() {
    super.initState();
    _setPrefs();
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
              appBar: AppBar(
                bottom: AppBarDivider(),
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  l10n.settings,
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
                    SwitchListTile(
                      secondary:
                          Icon(Icons.volume_off, color: Color(0xfff1e4d4)),
                      value: silent,
                      activeColor: Color(0xfff1e4d4),
                      title: Text(
                        l10n.silentMode,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          silent = value;
                          prefs.setBool('silent', value);
                        });
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SwitchListTile(
                      secondary:
                          Icon(Icons.vibration, color: Color(0xfff1e4d4)),
                      value: vibration,
                      activeColor: Color(0xfff1e4d4),
                      title: Text(
                        l10n.vibration,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          vibration = value;
                          prefs.setBool('vibration', value);
                        });
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ExpansionTile(
                      key: languageListKey,
                      leading: Icon(Icons.language, color: Color(0xfff1e4d4)),
                      trailing: languageListExpanded
                          ? Icon(
                              Icons.keyboard_arrow_up,
                              color: Color(0xfff1e4d4),
                            )
                          : Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xfff1e4d4),
                            ),
                      onExpansionChanged: (expanded) {
                        setState(() {
                          languageListExpanded = expanded;
                        });
                      },
                      initiallyExpanded: false,
                      title: new Text(
                        language != null
                            ? getLanguage(
                                Localizations.localeOf(context).languageCode)
                            : l10n.systemLanguage,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        for (final languageKey in [
                          null,
                          ...languages.keys
                        ]) ...[
                          ListTile(
                            selectedTileColor: Colors.black12,
                            selected: language == languageKey,
                            leading: languageKey != null
                                ? Icon(Icons.remove, color: Color(0xfff1e4d4))
                                : Icon(Icons.settings_applications,
                                    color: Color(0xfff1e4d4)),
                            title: Text(
                              languageKey == null
                                  ? l10n.systemLanguage
                                  : languages[languageKey],
                              style: TextStyle(
                                color: Color(0xfff1e4d4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              MorseApp.setLocale(
                                  context,
                                  languageKey != null
                                      ? Locale(languageKey)
                                      : null);
                              if (languageKey == null) {
                                prefs.remove('languageCode');
                              } else {
                                prefs.setString('languageCode', languageKey);
                              }
                              setState(() {
                                languageListKey = Key("0") == languageListKey
                                    ? Key("1")
                                    : Key("0");
                                languageListExpanded = false;
                                language = languageKey;
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SwitchListTile(
                      secondary: isSingleKeyKeyboard
                          ? Icon(Icons.keyboard, color: Color(0xfff1e4d4))
                          : Icon(Icons.keyboard_outlined,
                              color: Color(0xfff1e4d4)),
                      value: isSingleKeyKeyboard,
                      activeColor: Color(0xfff1e4d4),
                      title: Text(
                        isSingleKeyKeyboard
                            ? l10n.singleKeyKeyboard
                            : l10n.doubleKeyKeyboard,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isSingleKeyKeyboard = value;
                          prefs.setBool('isSingleKeyKeyboard', value);
                        });
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Icon(Icons.keyboard, color: Color(0xfff1e4d4)),
                      enabled: false,
                      title: Text(
                        l10n.keyboardInputTimeout,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        l10n.keyboardInputTimeoutValue(timeOut),
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Slider(
                      activeColor: Color(0xfff1e4d4),
                      inactiveColor: Colors.grey,
                      min: 1.0,
                      max: 2.5,
                      divisions: 6,
                      onChanged: (newRating) {
                        setState(() {
                          timeOut = newRating;
                          var outTime = (newRating * 1000).toInt();
                          prefs.setInt('timeOut', outTime);
                        });
                      },
                      value: timeOut,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        l10n.secretFnc,
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        l10n.secretFncDesc,
                        style: TextStyle(
                          color: Color(0xaff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xfff1e4d4),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/CodeDecode');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
