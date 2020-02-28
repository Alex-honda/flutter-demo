import 'package:flutter/material.dart';
import 'components/anchor.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("JSON读取和解析"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlineButton(
        child: Text("点击获取数据"),
        onPressed: () {
          getAnchors();
        },
      ),
    );
  }
}
