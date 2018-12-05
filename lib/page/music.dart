import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_module/theme.dart';

class MusicPlay extends StatefulWidget {
  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
        body: Column(
          children: <Widget>[
            // Seek bar
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 125,
                    height: 125,
                    child: ClipOval(
                      clipper: CircleClipper(),
                      child: Image.network(
                        'https://img2.ch999img.com/newstatic/1377/85283a12872b49.jpg.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // visulizer
            Container(
              width: double.infinity,
              height: 105.0,
            ),

            // control

            ControllerView()
          ],
        ));
  }
}


/// 控制器
class ControllerView extends StatefulWidget {
  @override
  _ControllerViewState createState() => new _ControllerViewState();
}

class _ControllerViewState extends State<ControllerView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: accentColor,
      padding: EdgeInsets.only(bottom: 40),
      child: Material(
        shadowColor: const Color(0x44000000),
        color: accentColor,
        child: Column(
          children: <Widget>[
            // song name
            Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 40.0),
                child: RichText(
                  text: TextSpan(text: '', children: [
                    TextSpan(
                      text: 'Song Title\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                          height: 1.5),
                    ),
                    TextSpan(
                        text: 'Artist Name',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12.0,
                            letterSpacing: 3.0,
                            height: 1.5))
                  ]),
                )),

            // controller
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                    splashColor: lightAccentColor,
                    highlightColor: lightAccentColor.withOpacity(0.5),
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  RawMaterialButton(
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    splashColor: lightAccentColor,
                    highlightColor: lightAccentColor.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.play_arrow,
                        size: 35,
                        color: darkAccentColor,
                      ),
                    ),
                    elevation: 5.0,
                    highlightElevation: 10.0,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                    splashColor: lightAccentColor,
                    highlightColor: lightAccentColor.withOpacity(0.5),
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    iconSize: 35,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(),
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

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}