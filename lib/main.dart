import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trianglelist/painter_triangle.dart' as tripainter;

void main() {
  runApp( _Body2() );
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ruled Line TextField'),
        ),
        body: RuledLineTextField(),
      ),
    );
  }
}

final globalKeyGetTextField = GlobalKey();

class RuledLineTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: TextUnderLinePainter(),
          ),
          TextField(
            style: TextStyle(
                fontSize: 20.0,
                height: 2.0,
                color: Colors.black
            ),
            key: globalKeyGetTextField,
            keyboardType: TextInputType.multiline,
            maxLines: 1000,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}

class TextUnderLinePainter extends CustomPainter {
  TextUnderLinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final textFieldRenderBox =
    globalKeyGetTextField.currentContext!.findRenderObject() as RenderBox;

    final ruledLineWidth = textFieldRenderBox.size.width;
    final ruledLineSpace = textFieldRenderBox.size.height / 1000;
    const ruledLineContentPadding = 15;

    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    for (var i = 1; i <= 1000; i++) {
      canvas.drawLine(
          Offset(0, ruledLineSpace * i + ruledLineContentPadding),
          Offset(ruledLineWidth, ruledLineSpace * i + ruledLineContentPadding),
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> with TickerProviderStateMixin {
  var _sides = 5.0;
  var _radius = 100.0;
  var _radians = 0.0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    Tween<double> _rotationTween = Tween(begin: -pi, end: pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _SamplePainter(_sides, _radius, animation.value),
            ),
          );
        });
  }
}

class _SamplePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  _SamplePainter(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(radius * cos(radians), radius * sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * cos(radians + angle * i) + center.dx;
      double y = radius * sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class _Body2 extends StatelessWidget {
  _Body2();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: CustomPaint(
        painter: _SamplePainter2(),
      ),
    );
  }
}

class ColorPickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Battery Optimizer'),
        centerTitle: false,
        elevation: 0,
      ),
      body: _Body(),
    );
  }
}

class _SamplePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 20;

    final paint2 = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke; // Pathを使う場合必須

    var halfwidth = size.width * 0.5;
    var halfheight = size.height * 0.5;

    canvas.drawLine( Offset(halfwidth, 0), Offset(halfwidth, size.height), paint);
    canvas.drawLine( Offset(0, halfheight), Offset(size.width, halfheight), paint);

    var circlePath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 100,
      ));
    canvas.drawPath(circlePath, paint2);

    var horizontalPath = Path()
      ..moveTo(0, halfheight)
      ..lineTo(size.width, halfheight);
    canvas.drawPath(horizontalPath, paint2);

    var verticalPath = Path()
      ..moveTo(halfwidth, 0)
      ..lineTo(halfwidth, size.height);
    canvas.drawPath(verticalPath, paint2);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triangle List',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Triangle List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        children: [
          TableRow( children: [
            Center(child: Text("番号") ),
            Center(child: Text("測点") ),
            Center(child: Text("辺長A") ),
            Center(child: Text("辺長B") ),
            Center(child: Text("辺長C") ),
            Center(child: Text("親") ),
            Center(child: Text("接続") ),
          ]),
          TableRow( children: [
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
          ]),
          TableRow( children: [
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
            Center(child: TextField() ),
          ]),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
    );

  }
}
