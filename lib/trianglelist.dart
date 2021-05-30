
import 'dart:ui';
import 'package:trianglelist/point_xy.dart';
import 'package:trianglelist/triangle.dart';

class TriangleList{
  List<Triangle> trilist = List.generate(0, (index) => Triangle() );

  TriangleList(){}

  TriangleList.points( List<Offset> points ){
    points.forEach((offset) => add( Triangle.first( 50, 50, 50, PointXY( offset.dx, offset.dy ), 0 ) ) );
  }

  void drawAll( Canvas canvas, paint ){
    trilist.forEach((tri) => drawTri( tri, canvas, paint ) );
  }

  void drawTri( Triangle tri, Canvas canvas, paint ){
    canvas.drawLine( tri.pointCA_, tri.pointAB_, paint );
    canvas.drawLine( tri.pointAB_, tri.pointBC_, paint );
    canvas.drawLine( tri.pointBC_, tri.pointCA_, paint );
  }

  void add( Triangle tri ) { trilist.add( tri ); }
}