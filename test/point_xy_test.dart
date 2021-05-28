import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:trianglelist/point_xy.dart';

void main() {

  test('min_max', (){
    PointXY p = PointXY(0, 0);
    expect( p.min(PointXY(1, 0)).x_, 0 );
    expect( p.max(PointXY(1, 0)).x_, 1 );
    expect( p.max(PointXY(-1, 0)).x_, 0 );
    expect( p.min(PointXY(-1, 0)).x_, -1 );
  });

  test('add_minus_add', (){
    PointXY p1 = PointXY(1, 0);
    PointXY p2 = PointXY(1, 0);
    p1.add( p1 ); // add rewrite it
    p1.addminus( p2 ); // add rewrite it
    expect(p1.x_, 1);

  });

  test('reference_or_rewrite', () {
    PointXY p1 = PointXY(0, 0);
    p1.add_xy(1, 0); // add rewrite it
    p1.plus_xy(1, 0); // plus is NOT rewrite it
    expect(p1.x_, 1);
  });

  test('pointXY test', (){
    PointXY p = new PointXY(5, 5);
    expect(p.x_, 5);
  });
}