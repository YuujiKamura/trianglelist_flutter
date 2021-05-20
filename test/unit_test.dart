import 'package:test/test.dart';
import 'package:trianglelist/triangle.dart';

void main() {
  test('triangle test', (){
    Triangle tri = Triangle( 5, 5, 5);
    expect(tri.lengthA_, 5);
  });
}