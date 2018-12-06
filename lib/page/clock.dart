import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 150,
              width: double.infinity,
              color: Colors.indigoAccent,
              child: Text('data'),
            )),
            Expanded(
              flex: 3,
              child: Container(
                margin:EdgeInsets.all(24),
                width: double.infinity,
                color: Colors.greenAccent,
                child: Center(child: Text('2')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text('3'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
