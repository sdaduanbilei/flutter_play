
import 'package:flutter/material.dart';

class PageSelect extends StatefulWidget {
  @override
  _PageSelectState createState() => _PageSelectState();
}

class _PageSelectState extends State<PageSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: _buildCardStack(),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildCardStack() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage('http://p1.pstatp.com/origin/2a4100008d310b5fd8a8'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              )
            ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RoundIconButton.small(
              icon: Icons.refresh,
              iconColor: Colors.orange,
            ),
            RoundIconButton.large(
              icon: Icons.clear,
              iconColor: Colors.red,
            ),
            RoundIconButton.small(
              icon: Icons.star,
              iconColor: Colors.lightBlue,
            ),
            RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.green,
            ),
            RoundIconButton.small(
              icon: Icons.lock,
              iconColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundClipper extends CustomClipper<Rect>{

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(-10, 10, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }


}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
            )
          ]),
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 0.0,
        child: Icon(
          icon,
          color: iconColor,
        ), onPressed: () {},
      ),
    );
  }
}
