import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.76,
      size.width * 0.5, size.height * 0.5,
    );

    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.2,
      size.width, size.height * 0.4,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    color: Colors.white,
    debugShowCheckedModeBanner: false,
    home: BezierCurves(),
  ));
}

class BezierCurves extends StatelessWidget {
  const BezierCurves({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BezierClipper(),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFFAD1457), Color(0xFF4A148C)],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.sort_rounded,
                                color: Colors.white60,
                                size: 22,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.search,
                                color: Colors.white60,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.g_translate_outlined,
                                color: Colors.white60,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Jeni",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "^ Chennai, India",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverTextDivider(
                  text: 'Rent',
                  textColor: Colors.grey,
                  hoverTextColor: Colors.black,
                  dividerColor: Colors.transparent,
                  hoverDividerColor: Colors.purple,
                ),
                SizedBox(width: 20),
                HoverTextDivider(
                  text: 'e-attendance',
                  textColor: Colors.grey,
                  hoverTextColor: Colors.black,
                  dividerColor: Colors.transparent,
                  hoverDividerColor: Colors.purple,
                ),
                SizedBox(width: 20),
                HoverTextDivider(
                  text: 'Ride',
                  textColor: Colors.grey,
                  hoverTextColor: Colors.black,
                  dividerColor: Colors.transparent,
                  hoverDividerColor: Colors.purple,
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 290,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfymUrIqkWPqdCuTPGd-jHoNF0xioyob51qQ&s"),
            ),
          ),
        ],
      ),
    );
  }
}
class HoverTextDivider extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color hoverTextColor;
  final Color dividerColor;
  final Color hoverDividerColor;

  HoverTextDivider({
    required this.text,
    required this.textColor,
    required this.hoverTextColor,
    required this.dividerColor,
    required this.hoverDividerColor,

  });

  @override
  _HoverTextDividerState createState() => _HoverTextDividerState();
}

class _HoverTextDividerState extends State<HoverTextDivider> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: _isHovering ? widget.hoverTextColor : widget.textColor,
              fontSize: 24,
            ),
            child: Text(widget.text),
          ),
          SizedBox(height: 497),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 10,
            width: 100,
            color: _isHovering ? widget.hoverDividerColor : widget.dividerColor,
          ),
        ],
      ),
    );
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}

