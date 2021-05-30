import 'package:test/test.dart';
import 'package:trianglelist/point_xy.dart';
import 'package:trianglelist/triangle.dart';

void main() {

  test('test calc point', (){
  PointXY pca = PointXY(0, 0);
  Triangle myTriangle = new Triangle.first(3, 4, 5, pca, 0);

  expect( myTriangle.pointAB_.dx, 3 );
  expect( myTriangle.pointAB_.dy, 0 );
  expect( myTriangle.pointBC_.dx, 3 );
  expect( myTriangle.pointBC_.dy, -4 );

  expect( myTriangle.angleCA_, 90.000 );
  expect( myTriangle.angleAB_, 36.870 );
  expect( myTriangle.angleBC_, 53.130 );

  });

  test('get area test', (){
    Triangle tri = Triangle.first( 3, 4, 5, PointXY(0,0), 0 );
    expect(tri.area, 6);
  });

  test('triangle test', (){
    Triangle tri = Triangle.first( 5, 5, 5, PointXY(0,0), 0 );
    expect(tri.lengthA_, 5);
  });
}