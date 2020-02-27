import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("生命周期")),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomeBody build");
    return MyCounterWidget();
  }
}

class MyCounterWidget extends StatefulWidget {

  MyCounterWidget(){
    print("执行了MyCounterWidget的构造方法");
  }

  @override
  State<StatefulWidget> createState() {
    print("执行了MyCounterWidget的createState方法");
    return MyCounterWidgetState();
  }
}

class MyCounterWidgetState extends  State<MyCounterWidget>{
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print("执行了MyCounterWidgetState的initState方法");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了MyCounterWidgetState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("执行了MyCounterWidgetState的build方法");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: (){
                  setState(() {
                    counter --;
                  });
                },
              ),
              RaisedButton(
                color: Colors.greenAccent,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: (){
                  setState(() {
                    counter ++;
                  });
                },
              ),
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行MyCounterWidgetState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    super.dispose();
    print("执行了MyCounterWidgetState的dispose方法");
  }
}