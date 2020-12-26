import 'package:flutter/material.dart';

class DoubleKeyKeyboard extends StatelessWidget {
  const DoubleKeyKeyboard(
      {Key key, @required this.onLeftTap, @required this.onRightTap})
      : super(key: key);

  final void Function() onLeftTap;
  final void Function() onRightTap;

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: InkWell(
              onTap: onLeftTap,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        VerticalDivider(
          color: Colors.grey[350],
          thickness: 1.5,
          indent: 16,
          endIndent: 16,
        ),
        Expanded(
          child: Container(
            child: InkWell(
              onTap: onRightTap,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
