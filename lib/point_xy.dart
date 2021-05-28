
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

  void add( PointXY p1 ){
    x_ = x_ + p1.x_;
    y_ = y_ + p1.y_;
  }

  void add_xy( double x, double y ){
    x_ = x_ + x;
    y_ = y_ + y;
  }

  PointXY plus_xy( double x, double y ){
    return PointXY( x_+x, y_+y );
  }

  void addminus( PointXY p1 ){
    x_ = x_ - p1.x_;
    y_ = y_ - p1.y_;
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

  PointXY min( PointXY p){
    PointXY sp = PointXY(x_,y_);
    if( x_ > p.x_ ) sp.x_ = p.x_;
    if( y_ > p.y_ ) sp.y_ = p.y_;
    return sp;
  }

  PointXY max( PointXY p){
    PointXY sp = PointXY(x_,y_);
    if( x_ < p.x_ ) sp.x_ = p.x_;
    if( y_ < p.y_ ) sp.y_ = p.y_;
    return sp;
  }

}