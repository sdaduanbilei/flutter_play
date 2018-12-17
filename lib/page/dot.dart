import 'dart:math';

import 'package:flutter/material.dart';

class DotAnima extends StatefulWidget {
  @override
  _DotAnimaState createState() => _DotAnimaState();
}

class _DotAnimaState extends State<DotAnima>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  double radius = 5.0;
  final double initialRadius = 20.0;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation_rotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear
        )));
    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        
        child: Center(
          child: RotationTransition(
            turns: animation_rotation,
            child: Stack(
              children: <Widget>[
                Dot(
                  radius: radius,
                  color: Colors.black12,
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.redAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.greenAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.blueAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.yellowAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.pinkAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.orangeAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.purpleAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                  child: Dot(
                    radius: 5,
                    color: Colors.tealAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
