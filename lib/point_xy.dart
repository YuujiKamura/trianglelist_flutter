
class PointXY {
  double x_ = 0;
  double y_ = 0;

  PointXY(double x, double y){
    x_ = x;
    y_ = y;
  }

  PointXY.point( PointXY p ){
    x_ = p.x_;
    y_ = p.y_;
  }

  PointXY clone(){
    return new PointXY.point( this );
  }

  void set( PointXY p ){
    x_ = p.x_;
    y_ = p.y_;
  }

  PointXY flip( PointXY p2 ){
    PointXY p3 = new PointXY.point(p2);
    this.set( p2 );
    return p3;
  }

}