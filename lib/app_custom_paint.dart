

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PentagonRotApp extends StatefulWidget {
  @override
  PentagonBodyState createState() => PentagonBodyState();
}

class PentagonBodyState extends State<PentagonRotApp> with TickerProviderStateMixin {
  var _sides = 5.0;
  var _radius = 100.0;
  var _radians = 0.0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    Tween<double> _rotationTween = Tween(begin: -pi, end: pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: SamplePainter(_sides, _radius, animation.value),
            ),
          );
        });
  }
}

class SamplePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  SamplePainter(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(radius * cos(radians), radius * sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * cos(radians + angle * i) + center.dx;
      double y = radius * sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class Body2 extends StatelessWidget {
  Body2();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: CustomPaint(
        painter: SamplePainter2(),
      ),
    );
  }
}

class ColorPickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Battery Optimizer'),
        centerTitle: false,
        elevation: 0,
      ),
      body: PentagonRotApp(),
    );
  }
}

class SamplePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 20;

    final paint2 = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke; // Pathを使う場合必須

    var halfwidth = size.width * 0.5;
    var halfheight = size.height * 0.5;

    canvas.drawLine( Offset(halfwidth, 0), Offset(halfwidth, size.height), paint);
    canvas.drawLine( Offset(0, halfheight), Offset(size.width, halfheight), paint);

    var circlePath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 100,
      ));
    canvas.drawPath(circlePath, paint2);

    var horizontalPath = Path()
      ..moveTo(0, halfheight)
      ..lineTo(size.width, halfheight);
    canvas.drawPath(horizontalPath, paint2);

    var verticalPath = Path()
      ..moveTo(halfwidth, 0)
      ..lineTo(halfwidth, size.height);
    canvas.drawPath(verticalPath, paint2);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}