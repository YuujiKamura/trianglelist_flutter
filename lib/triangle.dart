
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart';
import 'package:trianglelist/point_xy.dart';

extension Precision on double {
  double toPrecision(int fractionDigits) {
    num mod = math.pow(10, fractionDigits.toDouble());
    return ((this * mod).round().toDouble() / mod);
  }
}

class Triangle{
  double lengthA_ = 0;
  double lengthB_ = 0;
  double lengthC_ = 0;
  double sumABC_ = 0;
  double S_ = 0;
  PointXY pointCA_ = PointXY(0,0);
  PointXY pointAB_ = PointXY(0,0);
  PointXY pointBC_ = PointXY(0,0);
  PointXY pointCenter_ = PointXY(0,0);
  double angleCA_ = 0;
  double angleAB_ = 0;
  double angleBC_ = 0;

  Triangle(){}

  Triangle.first( double a, double b, double c, PointXY pCA, double angle ){
    lengthA_ = a;
    lengthB_ = b;
    lengthC_ = c;
    sumABC_ = lengthA_ + lengthB_ + lengthC_;
    S_ = (sumABC_*0.5)*((sumABC_*0.5)- lengthA_)*((sumABC_*0.5)- lengthB_)*((sumABC_*0.5)- lengthC_);

    _calcPoint(pCA, angle);
  }

  Triangle.simple( double a, double b, double c ){
    lengthA_ = a;
    lengthB_ = b;
    lengthC_ = c;
    sumABC_ = lengthA_ + lengthB_ + lengthC_;
    S_ = (sumABC_*0.5)*((sumABC_*0.5)- lengthA_)*((sumABC_*0.5)- lengthB_)*((sumABC_*0.5)- lengthC_);

    _calcPoint( pointCA_, 0 );
  }

  num get area => math.sqrt( S_ ); //pow( S_, 0.5);

  void _calcPoint( PointXY pCA, double angle ){

    pointCA_ = pCA;
    pointAB_ = PointXY( ( pCA.dx + ( lengthA_ * math.cos( radians(angle) ) ) ).toPrecision(3),
                        ( pCA.dy + ( lengthA_ * math.sin( radians(angle) ) ) ).toPrecision(3) );

    double theta = math.atan2( pCA.dy - pointAB_.dy, pCA.dx - pointAB_.dx );

    num powA = math.pow( lengthA_, 2);
    num powB = math.pow( lengthB_, 2);
    num powC = math.pow( lengthC_, 2);
    double alpha = math.acos( ( powA + powB - powC ) / ( 2 * lengthA_ * lengthB_ ));

    pointBC_ = PointXY( ( pointAB_.dx + ( lengthB_ * math.cos( theta + alpha) ) ).toPrecision(3),
                        ( pointAB_.dy + ( lengthB_ * math.sin( theta + alpha) ) ).toPrecision(3) );

    angleCA_ = calcInternalAngle( pointCA_, pointAB_, pointBC_ ).toPrecision(3);
    angleAB_ = calcInternalAngle( pointAB_, pointBC_, pointCA_ ).toPrecision(3);
    angleBC_ = calcInternalAngle( pointBC_, pointCA_, pointAB_ ).toPrecision(3);

    pointCenter_ = PointXY( ( pointCA_.dx + pointAB_.dx + pointCA_.dx ) / 3, ( pointCA_.dy + pointAB_.dy + pointCA_.dy ) / 3 );

  }

  double calcInternalAngle(PointXY p1, PointXY p2, PointXY p3) {
    PointXY v1 = p1.minus( p2 );
    PointXY v2 = p3.minus( p2 );
    double angleRadian = math.acos( v1.innerProduct(v2) / ( v1.magnitude() * v2.magnitude() ) );
    double angleDegree = angleRadian * 180 / math.pi;
    return angleDegree;
  }

}