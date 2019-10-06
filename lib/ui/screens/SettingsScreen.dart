import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double timeOut = 1.25;
  SharedPreferences prefs;
  bool silent = false;
  bool vibration = true;

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      silent = prefs.getBool('silent');
      timeOut = prefs.getInt('timeOut') / 1000;
      vibration = prefs.getBool('vibration');
    });
  }

  void initState() {
    super.initState();
    _setPrefs();
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
                  "Settings",
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
                        "Silent Mode",
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
                        "Vibration",
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
                    ListTile(
                      leading: Icon(Icons.keyboard, color: Color(0xfff1e4d4)),
                      enabled: false,
                      title: Text(
                        'Keyboard Input Timeout:',
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '$timeOut sec',
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
                        "Secret Function",
                        style: TextStyle(
                          color: Color(0xfff1e4d4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Not really ...",
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
