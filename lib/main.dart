import 'package:flutter/material.dart';

/*
* 1.创建main函数
* 2.执行runApp函数
* 3.传入Widget -> Text Widget
*
* Text需要一个方向的参数
*
* */

///main函数作为函数入口
/*void main(){
  runApp(MyApp());
}*/

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        appBar: AppBar(
            title: Text("我是标题")
        ),
        body: ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Hello World",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 30,
              color: Colors.yellow
          ),
        )
    );
  }
}