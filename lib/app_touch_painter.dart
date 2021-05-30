import 'package:flutter/material.dart';
import 'package:trianglelist/point_xy.dart';
import 'package:trianglelist/triangle.dart';
import 'package:trianglelist/trianglelist.dart';
//import 'package:zoom_widget/zoom_widget.dart';

//void main() => runApp(touchPainterApp());

class inputTable extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person, ),
        hintText: 'Input Length A',
        labelText: 'Length A:',
        border: OutlineInputBorder()
      )
    );
  }
}

class touchPainterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pointer drawing lesson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PointerDrawingWidget(title:'Pointer drawing lesson'),
    );
  }
}

class PointerDrawingWidget extends StatefulWidget {
  PointerDrawingWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PointerDrawingWidgetState createState() => _PointerDrawingWidgetState();
}

class _PointerDrawingWidgetState extends State<PointerDrawingWidget> {
  final _points = <Offset>[];
  Offset canvasOffset = Offset(0,0);
  double canvasScale = 1;
  bool isScale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        // TapDownイベントを検知
        onTapDown: _addPoint,
        onSecondaryTapDown: (details) { isScale = true; },
        onSecondaryTapUp:   (details) { isScale = false; },
        //onScaleStart: (details) { isScale = true; },
        //onScaleEnd:   (details) { isScale = false; },
        onPanUpdate: (details) {
          this.setState(() {
            if( isScale == false ) canvasOffset += details.delta;
            else canvasScale += details.delta.dy;
          });
        },
        // カスタムペイント
        child: CustomPaint(
          painter: MyPainter(_points, canvasOffset, canvasScale ),
          // タッチを有効にするため、childが必要
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: inputTable()
            ),
          ),
      ),
    ),
      floatingActionButton: FloatingActionButton(
        // 点のクリアボタン
        onPressed: _clearPoints,
        tooltip: 'Clear',
        child: Icon(Icons.clear),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // タッチした点をクリアする
  void _clearPoints(){
    setState((){
      _points.clear();
    });
  }

  void _moveCanvas(TapDownDetails details){
    //canvas.translate()
  }

  // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add( details.localPosition - canvasOffset );
    });
  }
}

class MyPainter extends CustomPainter{
  final List<Offset> _points;
  final _rectPaint = Paint()..color = Colors.blue;

  Offset canvasOffset;
  double canvasScale;

  MyPainter(this._points, this.canvasOffset, this.canvasScale );

  @override
  void paint(Canvas canvas, Size size) {
    TriangleList trilist = TriangleList.points(_points);

    canvas.translate(canvasOffset.dx, canvasOffset.dy);
    canvas.scale(canvasScale);
    trilist.drawAll( canvas, _rectPaint );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}