import 'package:flutter/material.dart';
import 'package:flutter_module/page/dot.dart';


class LoadingLayout extends StatefulWidget {
  @override
  _LoadingLayoutState createState() => _LoadingLayoutState();
}

class _LoadingLayoutState extends State<LoadingLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
         child: new DotAnima(),
      ),
    );
  }
}