import 'package:flutter/material.dart';

import 'app_custom_paint.dart';

// TOPページ起動
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY TODO',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

// TOPページ
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// TOPページのステータス管理
class _MyHomePageState extends State<MyHomePage> {
  // todoの一覧リスト変数を用意
  List<String> todoList = [];

  // テキストフィールドのコントローラー設定
  // コントローラーの宣言
  late TextEditingController _todoInputController;

  // コントローラーの初期化
  void initState() {
    super.initState();
    _todoInputController = TextEditingController();
  }

  // statefulオブジェクトが削除されるときに、参照を削除してくれる
  void dispose() {
    super.dispose();
    _todoInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scaffoldは画面構成の基本widget
    return Scaffold(
      // アプリ上部のコンテンツ設定
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("TODO一覧"),
      ),
      // アプリのコンテンツ部分の設定
      body: Column(
        // column widgetにwidgetのセットを配列で渡す
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _todoInputController,
              decoration: InputDecoration(hintText: '入力してください'),
              autofocus: true,
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: 0.0, right: 0.0, bottom: 30.0, left: 0.0),
            child: RaisedButton(
              color: Colors.teal[400],
              textColor: Colors.white,
              child: Text('保存'),
              onPressed: () {
                // 変数の変化をリアルタイムに通知する
                setState(
                      () {
                    // 何かしらの入力があるときだけ実行
                    if (_todoInputController.text.length > 0) {
                      // 配列に入力値を追加
                      todoList.add(_todoInputController.text);
                      // テキストボックスを初期化
                      _todoInputController.clear();
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: 0.0, right: 0.0, bottom: 30.0, left: 0.0),
            //child: Body(),
            ),
          Expanded(
            child: ListView.builder(
              // リストの長さを計算
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(
                      top: 0.0, right: 0.0, bottom: 0.0, left: 0.0),
                  margin: EdgeInsets.only(
                      top: 1.0, right: 0.0, bottom: 0.0, left: 0.0),
                  color: Colors.cyan[600],
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text(
                      // リストに表示する文字列を設定
                      ("$index : ${todoList[index]}"),
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}