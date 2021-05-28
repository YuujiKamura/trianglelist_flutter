
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RuledLineTextFieldApp extends StatelessWidget {
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