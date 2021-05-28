import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trianglelist/app_triangle_painter.dart' as tripainter;
import 'package:trianglelist/app_ruled_line_textfield.dart';
import 'package:trianglelist/app_touch_painter.dart';
import 'app_todo.dart';
import 'app_custom_paint.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Triangle List",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title_: "Triangle List" ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title_}) : super(key: key);
  String title_;
  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title_ = "title";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setTitle( String title ){
    setState(() {
      title_ = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title_),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
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
              Container(
                color: Colors.red,
                child: Center(child: TextField(
                  onChanged: (text) {
                  setTitle( text );
                },) ),
              ),
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
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
    );

  }
}
