import 'package:test/test.dart';
import 'package:trianglelist/point_xy.dart';

void main() {
  test('pointXY test', (){
    PointXY p = new PointXY(5, 5);
    expect(p.x_, 5);
  });
}