import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final screenHeight;

  LoginBackground({Key key, @required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapedClipper(),
      child: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.white,
            child: Image(
              image: AssetImage('assets/background_pic.jpg'),
            ),
          ),
        ),
        height: screenHeight * .45,
      ),
    );
  }
}

class BottomShapedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset curveStart = Offset(0, size.height * .75);
    Offset curveEnd = Offset(size.width, size.height * .75);

    Path path = Path();
    path.lineTo(curveStart.dx, curveStart.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEnd.dx, curveEnd.dy);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
