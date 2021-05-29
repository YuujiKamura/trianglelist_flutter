import 'package:test/test.dart';
import 'package:trianglelist/triangle.dart';

void main() {
  test('get area test', (){
    Triangle tri = Triangle( 3, 4, 5);
    expect(tri.area, 6);
  });

  test('triangle test', (){
    Triangle tri = Triangle( 5, 5, 5);
    expect(tri.lengthA_, 5);
  });
}