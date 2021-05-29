
import 'dart:math' as math;

class Triangle{
  double lengthA_ = 0;
  double lengthB_ = 0;
  double lengthC_ = 0;
  double sumABC_ = 0;
  double S_ = 0;

  Triangle( double a, double b, double c){
    lengthA_ = a;
    lengthB_ = b;
    lengthC_ = c;
    sumABC_ = lengthA_ + lengthB_ + lengthC_;
    S_ = (sumABC_*0.5)*((sumABC_*0.5)- lengthA_)*((sumABC_*0.5)- lengthB_)*((sumABC_*0.5)- lengthC_);
  }

  num get area => math.pow( S_, 0.5);
}