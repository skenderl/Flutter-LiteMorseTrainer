import 'package:flutter/material.dart';

class SingleKeyKeyboard extends StatelessWidget {
  const SingleKeyKeyboard(
      {Key key, @required this.onTap, @required this.onDoubleTap})
      : super(key: key);

  final void Function() onTap;
  final void Function() onDoubleTap;

  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onDoubleTap: onDoubleTap,
        onTap: onTap,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80.0),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80.0),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
