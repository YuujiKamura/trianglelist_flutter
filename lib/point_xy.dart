
import 'dart:math' as math;
import 'dart:ui' as ui;

class PointXY extends ui.Offset {

  PointXY( double _x, double _y ) : super(_x, _y){ }

  PointXY.p( PointXY p ) : super( p.dx, p.dy ){ }

  PointXY clone(){
    return new PointXY.p( this );
  }
/*
  void add( PointXY p1 ){
    x_ = x_ + p1.x_;
    y_ = y_ + p1.y_;
  }

  void add_xy( double _x, double _y ){
    x_ = x_ + _x;
    y_ = y_ + _y;
  }

  PointXY plus_xy( double _x, double _y ){
    return PointXY( x_+_x, y_+_y );
  }

  void addminus( PointXY p1 ){
    x_ = x_ - p1.x_;
    y_ = y_ - p1.y_;
  }

  PointXY set( PointXY p ){
    return PointXY.point( p );
  }

  PointXY flip( PointXY p2 ){
    PointXY p3 = new PointXY.point(p2);
    this = set( p2 );
    return p3;
  }
*/

  PointXY min( PointXY p){
    double xx = dx;
    double yy = dy;
    if( dx > p.dx ) xx = p.dx;
    if( dy > p.dy ) yy = p.dy;
    return PointXY( xx, yy );
  }

  PointXY max( PointXY p){
    double xx = dx;
    double yy = dy;
    if( dx < p.dx ) xx = p.dx;
    if( dy < p.dy ) yy = p.dy;
    return PointXY( xx, yy );
  }

  PointXY minus(PointXY p) {
    return PointXY(dx - p.dx, dy - p.dy);
  }

  double innerProduct(PointXY point) {
    return dx * point.dx + dy * point.dy;
  }

  double magnitude() {
    return math.sqrt(dx * dx + dy * dy);
  }

}